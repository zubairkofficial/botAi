<?php

namespace App\Http\Controllers\Backend;

use Carbon\Carbon;
use App\Models\Project;
use App\Models\Template;
use Illuminate\Http\Request;
use App\Models\SystemSetting;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class DashboardController extends Controller
{
    # admin dashboard
    public function index(Request $request)
    {

        # total words chart 
        $totalWordsChart = $this->totalWordsChart($request->timeline);
        $totalWordsData  = $totalWordsChart[0];
        $timelineText    = $totalWordsChart[1];

        # top 5 template words  
        $totalTemplateWordsData = $this->topFiveTemplateChart();

        # give permission to the Super admin
        $user = auth()->user();

        $view = view('backend.pages.dashboard', [
            'user'                      => $user,
            'totalWordsData'            => $totalWordsData,
            'timelineText'              => $timelineText,
            'totalTemplateWordsData'    => $totalTemplateWordsData,
        ]);

        if ($user->user_type == 'admin' && $user->hasRole('Super Admin')) {
            return $view;
        } else if ($user->user_type == 'admin') {
            $user->assignRole('Super Admin');
        }
        return $view;
    }

    # admin profile
    public function profile()
    {
        $user = auth()->user();
        return view('backend.pages.profile', compact('user'));
    }

    # admin profile
    public function updateProfile(Request $request)
    {
        $user = auth()->user();
        $user->name = $request->name;
        $user->phone = validatePhone($request->phone);
        $user->avatar = $request->avatar;

        if ($request->has('password') && $request->password != '') {
            if ($request->password != $request->password_confirmation) {
                flash(localize('Password confirmation does not match'))->error();
                return back();
            }
            $user->password = Hash::make($request->password);
        }

        $user->save();

        flash(localize('Profile has been updated'))->success();
        return back();
    }

    # total words chart
    private function totalWordsChart($time)
    {
        $timeline                   = 7; // 7, 30 or 90 days 
        $timelineText               = localize('Last 7 days');

        if ((int)$time > 7) {
            $timeline = (int) $time;
            if ($timeline == 30) {
                $timelineText               = localize('Last 30 days');
            } else {
                $timelineText               = localize('Last 3 months');
            }
        }

        $projects = Project::where('content_type',  'content')->where('created_at', '>=', Carbon::now()->subDays($timeline));

        if (auth()->user()->user_type == "customer") {
            $projects = $projects->where('user_id', auth()->user()->id);
        }

        $projectQueries = $projects->oldest();
        $totalWordsTimelineInString = '';
        $totalWordsAmountInString   = '';

        for ($i = $timeline; $i >= 0; $i--) {
            $totalWordsAmount = 0;

            foreach ($projectQueries->get() as $project) {
                if (date('Y-m-d', strtotime($i . ' days ago')) == date('Y-m-d', strtotime($project->created_at))) {
                    $totalWordsAmount += $project->words;
                }
            }

            if ($i == 0) {
                $totalWordsTimelineInString .= json_encode(date('Y-m-d', strtotime($i . ' days ago')));
                $totalWordsAmountInString .= json_encode($totalWordsAmount);
            } else {
                $totalWordsTimelineInString .= json_encode(date('Y-m-d', strtotime($i . ' days ago'))) . ',';
                $totalWordsAmountInString .= json_encode($totalWordsAmount) . ',';
            }
        }

        $totalWordsData         = new SystemSetting; // to create temp instance.
        $totalWordsData->labels =  $totalWordsTimelineInString;
        $totalWordsData->words = $totalWordsAmountInString;
        $totalWordsData->totalWords = $projectQueries->sum('words');

        return [$totalWordsData, $timelineText];
    }

    # top 5 template chart
    private function topFiveTemplateChart()
    {
        $templates = Template::orderBy('total_words_generated', 'DESC')->take(5);
        $totalTemplateWordsCount = $templates->sum('total_words_generated');
        $templatesLabelsInString = '';
        $templateSeries = [];

        foreach ($templates->get() as $key => $template) {
            $templatesLabelsInString .= json_encode($template->collectLocalization('name'));
            if ($key + 1 != 5) {
                $templatesLabelsInString .= ',';
            }
            array_push($templateSeries, (float) $template->total_words_generated);
        }

        $totalTemplateWordsData = new SystemSetting; // to create temp instance.
        $totalTemplateWordsData->totalTemplateWordsCount = $totalTemplateWordsCount;
        $totalTemplateWordsData->series = json_encode($templateSeries);
        $totalTemplateWordsData->labels = $templatesLabelsInString;

        return $totalTemplateWordsData;
    }
}

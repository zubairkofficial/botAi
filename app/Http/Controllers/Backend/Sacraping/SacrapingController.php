<?php

namespace App\Http\Controllers\Backend\Sacraping;

use App\Http\Controllers\Controller;
use App\Models\Project;
use Pdf;
class SacrapingController extends Controller
{

    public function index()
    {
        return view('backend.pages.sacraping.index');
    }
    public function generatePdf($projectId)
    {
        
        $proj= Project::find($projectId);
        $project =[
            'title'=>$proj->title,
            'content'=>$proj->content,
        ];
        $pdf = Pdf::loadView('backend.pages.pdf.product_sacraping',compact('project'));

        return $pdf->download('product_reviews_analysis.pdf');
    }

}

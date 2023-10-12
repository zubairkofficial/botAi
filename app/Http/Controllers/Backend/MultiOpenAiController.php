<?php

namespace App\Http\Controllers\Backend;


use App\Http\Controllers\Controller;
use App\Http\Requests\MultiOpenAiKeyRequestForm;
use App\Models\OpenAiKey;
use Illuminate\Http\Request;
use Orhanerday\OpenAi\OpenAi;

class MultiOpenAiController extends Controller
{
    # construct
    public function __construct()
    {
        $this->middleware(['permission:multiOpenAi'])->only('index');
        $this->middleware(['permission:add_multiOpenAi'])->only(['create', 'store']);
        $this->middleware(['permission:edit_multiOpenAi'])->only(['edit', 'update']);
        $this->middleware(['permission:status_multiOpenAi'])->only(['updateStatus']);
        $this->middleware(['permission:delete_multiOpenAi'])->only(['delete']);
    }

    # API Key List
    public function index(Request $request)
    {
        $searchKey = $request->search ?? null;
        $status = $request->status ?? null;

        $openAiKeys = OpenAiKey::oldest()->when($searchKey, function ($q) use ($searchKey) {
            $q->where('title', 'like', '%' . $searchKey . '%');
        })->when(in_array($status, [0, 1]) && $status != null, function ($q) use ($status) {
            $q->where('is_active',  $status);
        })->paginate(paginationNumber());

        return view('backend.pages.systemSettings.openAi.multiOpenAiKey', compact('openAiKeys', 'searchKey', 'status'));
    }


    # create new api key page
    public function create()
    {
        return view('backend.pages.systemSettings.openAi.createUpdate');
    }


    # store api key
    public function store(MultiOpenAiKeyRequestForm $request)
    {
        OpenAiKey::create($this->formatParams($request->all()));
        flash(localize('API Key has been inserted successfully'))->success();
        return redirect()->route('admin.multiOpenAi.index');
    }


    # edit api key
    public function edit($id)
    {
        $editApiKey = OpenAiKey::findOrFail($id);
        return view('backend.pages.systemSettings.openAi.createUpdate', compact('editApiKey'));
    }


    # update api key
    public function update(MultiOpenAiKeyRequestForm $request)
    {

        $id             = $request->id;
        $model          = OpenAiKey::findOrFail($id);
        $model->update($this->formatParams($request->all(), $id));
        flash(localize('API Key has been Updated successfully'))->success();
        return redirect()->route('admin.multiOpenAi.index');
    }


    # format parameters
    # return array
    private function formatParams($payload, $model_id = null): array
    {
        $params = [
            'engine' => $payload['engine'],
            'status' => $payload['status'],
            'api_key'    => $payload['api_key'],
        ];
        if ($model_id) {
            $params['updated_by'] = auth()->user()->id;
        } else {
            $params['created_by'] = auth()->user()->id;
        }
        return $params;
    }


    # status change
    public function updateStatus(Request $request)
    {
        $openAiKey = OpenAiKey::findOrFail($request->id);
        $openAiKey->is_active = $request->is_active;
        if ($openAiKey->save()) {
            return 1;
        }
        return 0;
    }


    # delete api key
    public function delete($id)
    {
        $model = OpenAiKey::findOrFail($id);
        $model->delete();
        flash(localize('API Key has been Deleted successfully'))->success();
        return redirect()->route('admin.multiOpenAi.index');
    }


    # get open ai account balance
    private function getBalance()
    {
        $open_ai = new OpenAi(openAiKey());

        $open_ai->setBaseURL("https://api.openai.com/dashboard/billing/credit_grants");
        dd($open_ai);

        // $open_ai = new OpenAi($open_ai_key);
        dd($open_ai->listModels()); // you should execute the request FIRST!
        var_dump($open_ai->getCURLInfo()); // You can call the request

        dd($open_ai);
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.openai.com/dashboard/billing/credit_grants',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => array(
                "Content-Type: application/json",
                'Authorization: Bearer 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'


            ),

        ));

        $response = curl_exec($curl);
        dd($response);
        // curl_close($curl);
        // echo $response;
    }
}

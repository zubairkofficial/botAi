<?php

namespace App\Http\Livewire\Sacraping;

use App\Http\Services\Sacraping;
use App\Models\Project;
use Pdf;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Livewire\Component;

class ProductSacrapingComponent extends Component
{
    public $productId;
    public $platform;

    public $projectId;

    public function getData()
    {
       
        // do {
        //     $response = Http::withHeaders([
        //         'Accept' => 'application/json',
        //         'X-RapidAPI-Key' => '24b5c5ae2fmsh1cb36b5405fd7dep1cc41ajsn65803d27984a',
        //         'X-RapidAPI-Host' => 'amazon-product-reviews-keywords.p.rapidapi.com',
        //     ])->get('https://amazon-product-reviews-keywords.p.rapidapi.com/product/reviews', [
        //         'asin' => $productId,
        //         'country' => 'US',
        //         'variants' => 1,
        //         'top' => 0,
        //         'page' => $page,
        //     ]);
    
        //     $data = $response->json(); // Convert the response to a PHP array.
    
        //     if (isset($data['reviews'])) {
        //         $reviews = $data['reviews'];
        //         $allReviews = array_merge($allReviews, $reviews);
        //         $totalReviews += count($reviews);
        //     } else {
        //         // Break the loop if there's no "reviews" key in the response.
        //         break;
        //     }
    
        //     $page++; // Increment the page number for the next request.
    
        // } while ($totalReviews < 30 && count($reviews) == 10);
        if ($this->platform === 'amazon') {
            $productId = $this->productId;
            $country = 'US';
            $page = 1;
            $response = Http::withHeaders([
                'Accept' => 'application/json',
                'X-RapidAPI-Key' => '24b5c5ae2fmsh1cb36b5405fd7dep1cc41ajsn65803d27984a',
                'X-RapidAPI-Host' => 'amazon-product-reviews-keywords.p.rapidapi.com',
            ])->get('https://amazon-product-reviews-keywords.p.rapidapi.com/product/reviews', [
                'asin' => $productId,
                'country' => $country,
                'variants' => $page,
                'top' => 0,
                'page' => $page,
            ]);
            //dd($response->json());

            if ($response->successful()) {
                $result = $response->json();
                $data = $result["reviews"];
                $sacrapingInstance = new Sacraping(); // Create an instance of the Sacraping class
                $data = $sacrapingInstance->promptGenForAmazon($data); // Call the method on the instance

                $this->storeProject($data);
                // $this->projectId ='';
                // $this->platform ='';

            }
        } elseif ($this->platform === 'b&n') {
            $productId = $this->productId;
            $url = "https://api.bazaarvoice.com/data/batch.json?passkey=caC2Xb0kazery1Vgcza74qqETLsDbclQWr3kbWiGXSvjI&apiversion=5.5&displaycode=19386_1_0-en_us&resource.q1=reviews&filter.q1=isratingsonly%3Aeq%3Afalse&filter.q1=productid%3Aeq%3A{$productId}&filter.q1=contentlocale%3Aeq%3Aen*%2Cen_US&sort.q1=relevancy%3Aa1&stats.q1=reviews&filteredstats.q1=reviews&include.q1=authors%2Cproducts%2Ccomments&filter_reviews.q1=contentlocale%3Aeq%3Aen*%2Cen_US&filter_reviewcomments.q1=contentlocale%3Aeq%3Aen*%2Cen_US&filter_comments.q1=contentlocale%3Aeq%3Aen*%2Cen_US&limit.q1=100&offset.q1=0&limit_comments.q1=3";

            // Make the HTTP request
            $response = Http::get($url);

            if ($response->successful()) {
                $json_response = $response->json();
                $data = $json_response['BatchedResults']['q1']['Results'];
                $sacrapingInstance = new Sacraping(); // Create an instance of the Sacraping class
                $data = $sacrapingInstance->promptGen($data); // Call the method on the instance
                $this->storeProject($data);
                // $this->projectId ='';
                // $this->platform ='';
            }
        }
    }

    public function storeProject($data)
    {
        $project = new Project();
        $project->user_id = Auth::user()->id;
        $project->template_id = 100;
        $project->custom_template_id = null;
        $project->model_name = 'gpt-4.0';
        $project->title = 'Unititled Project-' . Carbon::today();
        $project->slug = Str::slug($project->title, '-');
        $project->content = nl2br($data['response']); // Convert $data array to a JSON-encoded string
        $project->prompts = null;
        $project->completion = null;
        $responseString = $data['response'];
        $characterCount = strlen($responseString);
        $project->words = $characterCount; //count characters
        $project->content_type = 'product_reviews';
        $project->engine = 'OpenAI';
        $project->storage_type = 'local';
        $project->save();
        
        $this->projectId = $project->id;

    }
   
    public function render()
    {
        if ($this->productId) {

            $project = Project::find($this->projectId);
        } else {
            $project = [];
        }
        return view('livewire.sacraping.product-sacraping-component', ['project' => $project]);
    }
}

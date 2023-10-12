<?php

namespace App\Http\Controllers;

use App\Traits\Language;
use Illuminate\Http\Request;
use Faker\Generator as Faker;

class TestController extends Controller
{
    //
    use Language;
    public function index(Faker $faker)
    {
       

        $file_name = 'google_voice_details';
   
        $lists = $this->languageVoicesData();
        $data = [];
        $i = 0;
        foreach ($lists as $key => $list) {
            $j =1; 
           
            if(count($list) > 1) {
                foreach($list as $item) {
                    
                    $label_name = explode(' - ', $item['label']);
                    $name = $label_name[1] == 'Female' ?  $faker->firstNameFemale() : $faker->firstNameMale();
            
                    $data[$key][] = array(
                        'value' => $item['value'],
                        'label' => $name . '-' . $label_name[1]
                    );
                    $j++;
                }
            }elseif(count($list) == 1) {
                $label_name = explode(' - ', $list[0]['label']);        
                $name = $label_name[1] == 'Female' ?  $faker->firstNameFemale() : $faker->firstNameMale();
            
                $data[$key][] = array(
                    'value' => $list[0]['value'],
                    'label' => $name . '-' . $label_name[1]
                );
            }
           
         
            $i++;

        }
  
        file_put_contents($file_name . '.php', '<?php  ' . var_export($data, true) . ';');
        dd($data);
    }

}

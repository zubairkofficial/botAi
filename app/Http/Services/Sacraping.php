<?php

namespace App\Http\Services;

use Illuminate\Support\Facades\Http;

class Sacraping
{

    public function promptGen($data):array
    {
        $OPENAI_KEY = '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';
        $API_ENDPOINT = 'https://api.openai.com/v1/chat/completions';
        $prompt = "<Product Information>\n";
        $prompt .= "Product Name: \n";
        $prompt .= "Product Description: \n";
        $prompt .= "</Product Information>\n";

        $prompt .= "<Reviews>\n";
        //dd($prompt);

        foreach ($data as $review) {
            $prompt .= "<Review>\n";
            $prompt .= "Client Name: " . $review['SourceClient'] . "\n";
            $prompt .= "Client Rating: " . $review['Rating'] . "\n";
            $prompt .= "Total Rating: 5\n";
            $prompt .= "Client Review: " . $review['ReviewText'] . "\n";
            $prompt .= "</Review>\n";
        }

        $prompt .= "</Reviews>\n";

        $prompt .= "Prompt: Act as an expert marketer and market research analyst. Analyze the provided reviews to uncover key insights and compelling language to use in copy and messaging. Follow these steps:\n";
        $prompt .= "Read through all reviews carefully, multiple times if needed. Look for common themes, recurring questions or concerns, expressions of delight or frustration. Copy the actual language used verbatim whenever possible. Questions to guide analysis:\n";
        $prompt .= "What outcomes or results are customers hoping to achieve?\n";
        $prompt .= "What needs or problems are customers looking to solve?\n";
        $prompt .= "What specific benefits do customers mention?\n";
        $prompt .= "WWhat words or phrases do customers use frequently to describe their experience?\n\n";

        $prompt .= "Organize the insights and language into categories:\n";
        $prompt .= "Pain points: What problems or annoyances do customers frequently mention? What do they wish was different or better?\n";
        $prompt .= "Desired outcomes: What are customers ultimately trying to achieve or hoping to experience? What needs do they want fulfilled?\n";
        $prompt .= "Questions: What do customers wonder or ask about frequently regarding the product or service? What are they unsure or confused about?\n";
        $prompt .= "Favorite features: What specific attributes or capabilities do customers call out as valuable and pleasing? What creates delight?\n";
        $prompt .= "Identify the most compelling and insightful language to use in copy and messaging. Consider messages and wording that speak directly to the primary pain points, desired outcomes, and questions. Mirror the words and sentiments of customers.\n\n";

        $prompt .= "Potential headlines:\n";
        $prompt .= "What sentences or short phrases would make striking headlines?\n";
        $prompt .= "What types of headlines would resonate most?\n";
        $prompt .= "Compile examples of copy, headlines, and messaging based on these insights. For each, note the rationale for why that particular copy or message was chosen. Explain how it connects to the review analysis.\n\n";

        $prompt .= "Bullet point benefits: What are the 5-10 most appealing benefits or advantages mentioned?  What product attributes, features, or capabilities come up most often as positives?\n\n";

        $prompt .= "Inspirations for sales copy:\n";
        $prompt .= "What stories, examples, or anecdotes help to illustrate key benefits?\n";
        $prompt .= "What imagery or sensory language is used to describe the experience?\n";
        $prompt .= "What emotions are expressed in a genuine, authentic way?\n";
        $prompt .= "Make recommendations for how these insights and examples of copy could be tested to determine resonance with the target audience. Discuss ways both qualitative feedback and quantitative metrics could be used to optimize the copy and messaging over time based on reviews.\n\n";

        $prompt .= "Messages to improve:\n";
        $prompt .= "What objections, downsides, or disadvantages are mentioned in critical or lower-star reviews?\n";
        $prompt .= "What areas of confusion or unanswered questions can be addressed?\n";
        $prompt .= "What language choices seem inauthentic or overly salesy? How could this be improved?\n\n";

        $prompt .= "Perform word frequency analysis on the reviews. Identify frequently used words or phrases and consider their significance in relation to the book. Take note of any keywords or buzzwords that could be useful for marketing purposes.";

        $messages = [
            ['role' => 'system', 'content' => 'Act as an expert marketer and market research analyst'],
            ['role' => 'user', 'content' => $prompt],
        ];
        //dd($messages);
        try {
            $response = Http::withHeaders([
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $OPENAI_KEY,
            ])->post($API_ENDPOINT, [
                'model' => 'gpt-4',
                'messages' => $messages,
                'temperature' => 0,
                'n' => 1,
            ]);
            //dd($response->json());

            if ($response) {

                return $data = ['status' => 200, 'response' => $response->json()['choices'][0]['message']['content']];
            } else {
                // Handle API error
                return $data = ['status' => 201, 'response' => 'Api Error'];
            }
        } catch (\Exception $e) {
            // Handle exception
            return $data = ['status' => 403, 'response' => $e->getMessage()];
        }

    }

    public function promptGenForAmazon($data) :array
    {
        $OPENAI_KEY = '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';
        $API_ENDPOINT = 'https://api.openai.com/v1/chat/completions';
        $prompt = "<Product Information>\n";
        $prompt .= "Product Name: \n";
        $prompt .= "Product Description: \n";
        $prompt .= "</Product Information>\n";

        $prompt .= "<Reviews>\n";
        //dd($prompt);

        foreach ($data as $review) {
            $prompt .= "<Review>\n";
            $prompt .= "Client Name: " . $review['name'] . "\n";
            $prompt .= "Client Rating: " . $review['rating'] . "\n";
            $prompt .= "Total Rating: 5\n";
            $prompt .= "Client Review: " . $review['review'] . "\n";
            $prompt .= "</Review>\n";
        }

        $prompt .= "</Reviews>\n";

        $prompt .= "Prompt: Act as an expert marketer and market research analyst. Analyze the provided reviews to uncover key insights and compelling language to use in copy and messaging. Follow these steps:\n";
        $prompt .= "Read through all reviews carefully, multiple times if needed. Look for common themes, recurring questions or concerns, expressions of delight or frustration. Copy the actual language used verbatim whenever possible. Questions to guide analysis:\n";
        $prompt .= "What outcomes or results are customers hoping to achieve?\n";
        $prompt .= "What needs or problems are customers looking to solve?\n";
        $prompt .= "What specific benefits do customers mention?\n";
        $prompt .= "WWhat words or phrases do customers use frequently to describe their experience?\n\n";

        $prompt .= "Organize the insights and language into categories:\n";
        $prompt .= "Pain points: What problems or annoyances do customers frequently mention? What do they wish was different or better?\n";
        $prompt .= "Desired outcomes: What are customers ultimately trying to achieve or hoping to experience? What needs do they want fulfilled?\n";
        $prompt .= "Questions: What do customers wonder or ask about frequently regarding the product or service? What are they unsure or confused about?\n";
        $prompt .= "Favorite features: What specific attributes or capabilities do customers call out as valuable and pleasing? What creates delight?\n";
        $prompt .= "Identify the most compelling and insightful language to use in copy and messaging. Consider messages and wording that speak directly to the primary pain points, desired outcomes, and questions. Mirror the words and sentiments of customers.\n\n";

        $prompt .= "Potential headlines:\n";
        $prompt .= "What sentences or short phrases would make striking headlines?\n";
        $prompt .= "What types of headlines would resonate most?\n";
        $prompt .= "Compile examples of copy, headlines, and messaging based on these insights. For each, note the rationale for why that particular copy or message was chosen. Explain how it connects to the review analysis.\n\n";

        $prompt .= "Bullet point benefits: What are the 5-10 most appealing benefits or advantages mentioned?  What product attributes, features, or capabilities come up most often as positives?\n\n";

        $prompt .= "Inspirations for sales copy:\n";
        $prompt .= "What stories, examples, or anecdotes help to illustrate key benefits?\n";
        $prompt .= "What imagery or sensory language is used to describe the experience?\n";
        $prompt .= "What emotions are expressed in a genuine, authentic way?\n";
        $prompt .= "Make recommendations for how these insights and examples of copy could be tested to determine resonance with the target audience. Discuss ways both qualitative feedback and quantitative metrics could be used to optimize the copy and messaging over time based on reviews.\n\n";

        $prompt .= "Messages to improve:\n";
        $prompt .= "What objections, downsides, or disadvantages are mentioned in critical or lower-star reviews?\n";
        $prompt .= "What areas of confusion or unanswered questions can be addressed?\n";
        $prompt .= "What language choices seem inauthentic or overly salesy? How could this be improved?\n\n";

        $prompt .= "Perform word frequency analysis on the reviews. Identify frequently used words or phrases and consider their significance in relation to the book. Take note of any keywords or buzzwords that could be useful for marketing purposes.";

        $messages = [
            ['role' => 'system', 'content' => 'Act as an expert marketer and market research analyst'],
            ['role' => 'user', 'content' => $prompt],
        ];
        //dd($messages);
        try {
            $response = Http::withHeaders([
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $OPENAI_KEY,
            ])->post($API_ENDPOINT, [
                'model' => 'gpt-4',
                'messages' => $messages,
                'temperature' => 0,
                'n' => 1,
            ]);
            //dd($response->json());

            if ($response) {

                return $data = ['status' => 200, 'response' => $response->json()['choices'][0]['message']['content']];
            } else {
                // Handle API error
                return $data = ['status' => 201, 'response' => 'Api Error'];
            }
        } catch (\Exception $e) {
            // Handle exception
            return $data = ['status' => 403, 'response' => $e->getMessage()];
        }

    }
}

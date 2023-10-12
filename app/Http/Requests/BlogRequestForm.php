<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BlogRequestForm extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => ['required'],
            'category_id' => ['required'],
            'image' => ['sometimes', 'nullable'],
            'banner' => ['sometimes', 'nullable'],
            'meta_image' => ['sometimes', 'nullable'],
            'short_description' => ['sometimes', 'nullable'],
            'video_link' => ['sometimes', 'nullable'],
            'description' => ['sometimes', 'nullable'],
            'meta_title' => ['sometimes', 'nullable'],
            'meta_description' => ['sometimes', 'nullable'],
            'tag_ids' => ['sometimes', 'nullable', 'array'],
        ];
    }
    public function attributes()
    {
        return [
            'category_id' => 'category',
            'tag_ids' => 'tags'
        ];
    }
}

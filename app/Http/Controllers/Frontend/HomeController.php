<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Faq;
use App\Models\Blog;
use App\Models\Page;
use Illuminate\Http\Request;
use App\Models\SubscriptionPackage;
use Illuminate\Support\Facades\App;
use App\Http\Controllers\Controller;
use App\Models\GeneralSetupLocalization;
use App\Models\OfflinePaymentMethod;

class HomeController extends Controller
{
    # set theme
    public function theme($name = "")
    {
       
        session(['theme' => $name]);
        return redirect()->route('home');
    }

    # homepage
    public function index()
    {
   
        $packages = SubscriptionPackage::isActive()->get();
        $offlinePaymentMethods = OfflinePaymentMethod::where('is_active', 1)->get();
        return getView('pages.home', ['packages' => $packages, 'offlinePaymentMethods' => $offlinePaymentMethods]);
    }

    # pricing
    public function pricing()
    {
        $packages = SubscriptionPackage::isActive()->get();
        $offlinePaymentMethods = OfflinePaymentMethod::where('is_active', 1)->get();
        $faqs = Faq::oldest()->get();
        return getView('pages.pricing', ['packages' => $packages, 'faqs' => $faqs, 'offlinePaymentMethods' => $offlinePaymentMethods]);
    }

    # pricing
    public function testimonials()
    {
        $client_feedback = [];
        if (getSetting('client_feedback') != null) {
            $client_feedback = json_decode(getSetting('client_feedback'));
            $lang = App::getLocale();
            $generalSetupLocalization = GeneralSetupLocalization::where('lang_key', $lang)->where('entity', 'client_feedback')->first();
            if ($generalSetupLocalization) {
                $client_feedback = json_decode($generalSetupLocalization->value);
            }
        }
        return getView('pages.testimonials', ['client_feedback' => $client_feedback]);
    }

    # all blogs
    public function allBlogs(Request $request)
    {
        $searchKey  = null;
        $blogs = Blog::isActive()->latest();

        if ($request->search != null) {
            $blogs = $blogs->where('title', 'like', '%' . $request->search . '%');
            $searchKey = $request->search;
        }

        if ($request->category_id != null) {
            $blogs = $blogs->where('blog_category_id', $request->category_id);
        }

        $blogs = $blogs->latest()->get();
        return getView('pages.blogs.index', ['blogs' => $blogs, 'searchKey' => $searchKey]);
    }

    # blog details
    public function showBlog($slug)
    {
        $blog = Blog::where('slug', $slug)->first();
        return getView('pages.blogs.blogDetails', ['blog' => $blog]);
    }

    # about us page
    public function aboutUs()
    {
        $features = [];

        if (getSetting('about_us_features') != null) {
            $features = json_decode(getSetting('about_us_features'));
        }

        $why_choose_us = [];

        if (getSetting('about_us_why_choose_us') != null) {
            $why_choose_us = json_decode(getSetting('about_us_why_choose_us'));
        }

        return getView('pages.quickLinks.aboutUs', ['features' => $features, 'why_choose_us' => $why_choose_us]);
    }

    # contact us page
    public function contactUs()
    {
        return getView('pages.quickLinks.contactUs');
    }

    # quick link / dynamic pages
    public function showPage($slug)
    {
        $page = Page::where('slug', $slug)->first();
        return getView('pages.quickLinks.index', ['page' => $page]);
    }
}

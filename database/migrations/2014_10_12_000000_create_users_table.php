<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->integer('role_id')->nullable();
            $table->string('user_type')->default('customer');
            $table->string('name');
            $table->string('email')->nullable();
            $table->string('phone')->nullable();
            $table->tinyInteger('email_or_otp_verified')->default(0);
            $table->string('verification_code')->nullable();
            $table->string('new_email_verification_code')->nullable();
            $table->string('password')->nullable();
            $table->string('remember_token')->nullable();
            $table->string('provider_id')->nullable();
            $table->string('avatar')->nullable();
            $table->string('postal_code')->nullable();
            $table->double('user_balance')->default('0.00'); // affiliate

            $table->string('referral_code')->nullable(); // referrer
            $table->integer('num_of_clicks')->default(0); // referrer

            $table->integer('referred_by')->nullable(); // referred user
            $table->tinyInteger('is_commission_calculated')->default(1); // referred user

            $table->integer('subscription_package_id')->nullable();
            $table->tinyInteger('is_banned')->default(0);
            $table->timestamp('email_verified_at')->nullable();

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}

<?php namespace WebEd\Themes\Sgsoftware\Providers;

use Illuminate\Support\ServiceProvider;

class BootstrapModuleServiceProvider extends ServiceProvider
{
    protected $module = 'WebEd\Themes\Sgsoftware';

    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        app()->booted(function () {
            $this->booted();
        });
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {

    }

    private function booted()
    {
        add_new_template([
            'Homepage'
        ], 'Page');

        cms_settings()
            ->addSettingField('address', [
                'group' => 'theme-options',
                'type' => 'text',
                'piority' => 5,
                'label' => 'Address',
            ], function () {
                return [
                    'address',
                    get_settings('address'),
                    ['class' => 'form-control']
                ];
            })
            ->addSettingField('phone', [
                'group' => 'theme-options',
                'type' => 'text',
                'piority' => 5,
                'label' => 'Phone',
            ], function () {
                return [
                    'phone',
                    get_settings('phone'),
                    ['class' => 'form-control']
                ];
            })
            ->addSettingField('contact_email', [
                'group' => 'theme-options',
                'type' => 'text',
                'piority' => 5,
                'label' => 'Address',
            ], function () {
                return [
                    'contact_email',
                    get_settings('contact_email'),
                    ['class' => 'form-control']
                ];
            })
            ->addSettingField('header_background', [
                'group' => 'theme-options',
                'type' => 'selectImageBox',
                'piority' => 0,
                'label' => 'Header background',
                'helper' => null
            ], function () {
                return [
                    'header_background',
                    get_settings('header_background'),
                ];
            });
    }
}

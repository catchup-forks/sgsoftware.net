<?php namespace WebEd\Themes\Sgsoftware\Providers;

use Illuminate\Support\ServiceProvider;

class UninstallModuleServiceProvider extends ServiceProvider
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
        //acl_permission()
        //    ->unsetPermission('Permission 1 description', 'description-1', $this->module);
    }
}

<?php namespace WebEd\Themes\Sgsoftware\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Routing\Router;

class RouteServiceProvider extends ServiceProvider
{
    protected $namespace = 'WebEd\Themes\Sgsoftware\Http\Controllers';

    public function map(Router $router)
    {
        $router->group(['namespace' => $this->namespace, 'middleware' => 'web'], function (Router $router) {

            $moduleRoute = 'sgsoftware';

            $router->group(['prefix' => $moduleRoute], function (Router $router) use ($moduleRoute) {
                /**
                 * Put some route here
                 */
            });
        });
    }
}

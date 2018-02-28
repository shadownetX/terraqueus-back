<?php

/**
 * Created by PhpStorm.
 * User: vonp
 * Date: 28/02/18
 * Time: 14:42
 */

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation;
use Twig\Environment;

/**
 * Class AdminController
 */
class AdminController
{
    /**
     * @Annotation\Route("/dashboard", name="admin_dashboard")
     *
     * @param Environment $twig
     *
     * @return Response
     *
     * @throws \Twig_Error_Loader
     * @throws \Twig_Error_Runtime
     * @throws \Twig_Error_Syntax
     */
    public function dashboard(Environment $twig)
    {
        return new Response($twig->render("dashboard/index.html.twig"));
    }
}


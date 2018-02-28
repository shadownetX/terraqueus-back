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


class AdminController
{
    /**
     * @Annotation\Route("/dashboard", name="admin_dashboard")
     */
    public function dashboard(Environment $twig)
    {
        return new Response($twig->render("dashboard/index.html.twig"));
    }
}


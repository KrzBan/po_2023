<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductType;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/product')]
class ProductController extends AbstractController
{
    #[Route('/', name: 'app_product_index', methods: ['GET'])]
    public function index(ProductRepository $productRepository): Response
    {
        $products = $productRepository->findAll();
        $productsArray = [];

        foreach($products as $product){
            $productsArray[] = [
                'id' => $product->getId(),
                'name' => $product->getName(),
                'price' => $product->getPrice()
            ];
        }

        return $this->json($productsArray);

        return $this->render('product/index.html.twig', [
            'products' => $productRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_product_new', methods: ['POST'])]
    public function new(Request $request, ProductRepository $productRepository): Response
    {
        $fields = json_decode($request->getContent(), true);

        $product = new Product();
        $product->setName($fields['name']);
        $product->setPrice($fields['price']);

        $productRepository->save($product, true);

        return $this->json($product);
    }

    #[Route('/{id}', name: 'app_product_show', methods: ['GET'])]
    public function show(Product $product): Response
    {
        return $this->json($product);
    }

    #[Route('/{id}/edit', name: 'app_product_edit', methods: ['POST'])]
    public function edit(Request $request, Product $product, ProductRepository $productRepository): Response
    {
        $fields = json_decode($request->getContent(), true);

        $product->setName($fields['name']);
        $product->setPrice($fields['price']);

        $productRepository->save($product, true);

        return $this->json($product);
    }

    #[Route('/{id}', name: 'app_product_delete', methods: ['POST'])]
    public function delete(Request $request, Product $product, ProductRepository $productRepository): Response
    {
        $productRepository->remove($product, true);
       
        return $this->json($product);
    }
}

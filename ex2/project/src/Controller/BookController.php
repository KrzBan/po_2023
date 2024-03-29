<?php

namespace App\Controller;

use App\Entity\Book;
use App\Form\BookType;
use App\Repository\BookRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/book')]
class BookController extends AbstractController
{
    #[Route('/', name: 'app_book_index', methods: ['GET'])]
    public function index(BookRepository $bookRepository): Response
    {
        $books = $bookRepository->findAll();
        $booksArray = [];

        foreach($books as $book){
            $booksArray[] = [
                'id' => $book->getId(),
                'name' => $book->getName(),
                'price' => $book->getPrice()
            ];
        }

        return $this->json($booksArray);
    }

    #[Route('/new', name: 'app_book_new', methods: ['GET', 'POST'])]
    public function new(Request $request, BookRepository $bookRepository): Response
    {
        $fields = json_decode($request->getContent(), true);

        $book = new Book();
        $book->setName($fields['name']);
        $book->setPrice($fields['price']);

        $bookRepository->save($book, true);

        return $this->json($book);
    }

    #[Route('/{id}', name: 'app_book_show', methods: ['GET'])]
    public function show(Book $book): Response
    {
        return $this->json($book);
    }

    #[Route('/{id}/edit', name: 'app_book_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Book $book, BookRepository $bookRepository): Response
    {
        $fields = json_decode($request->getContent(), true);

        $book->setName($fields['name']);
        $book->setPrice($fields['price']);

        $bookRepository->save($book, true);

        return $this->json($book);
    }

    #[Route('/{id}', name: 'app_book_delete', methods: ['POST'])]
    public function delete(Request $request, Book $book, BookRepository $bookRepository): Response
    {
        $bookRepository->remove($book, true);
       
        return $this->json($book);
    }
}

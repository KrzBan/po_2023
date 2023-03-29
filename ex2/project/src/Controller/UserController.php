<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/user')]
class UserController extends AbstractController
{
    #[Route('/', name: 'app_user_index', methods: ['GET'])]
    public function index(UserRepository $userRepository): Response
    {
        $users = $userRepository->findAll();
        $usersArray = [];

        foreach($users as $user){
            $usersArray[] = [
                'id' => $user->getId(),
                'name' => $user->getFirstName(),
                'price' => $user->getLasttName()
            ];
        }

        return $this->json($usersArray);
    }

    #[Route('/new', name: 'app_user_new', methods: ['GET', 'POST'])]
    public function new(Request $request, UserRepository $userRepository): Response
    {
        $fields = json_decode($request->getContent(), true);

        $user = new User();
        $user->setFirstName($fields['firstName']);
        $user->setLasttName($fields['lastName']);

        $userRepository->save($user, true);

        return $this->json($user);
    }

    #[Route('/{id}', name: 'app_user_show', methods: ['GET'])]
    public function show(User $user): Response
    {
        return $this->json($user);
    }

    #[Route('/{id}/edit', name: 'app_user_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user, UserRepository $userRepository): Response
    {
        $fields = json_decode($request->getContent(), true);

        $user->setFirstName($fields['firstName']);
        $user->setLasttName($fields['lastName']);

        $userRepository->save($user, true);

        return $this->json($user);
    }

    #[Route('/{id}', name: 'app_user_delete', methods: ['POST'])]
    public function delete(Request $request, User $user, UserRepository $userRepository): Response
    {
        $userRepository->remove($user, true);
       
        return $this->json($user);
    }
}

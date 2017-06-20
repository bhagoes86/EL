<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Feedback extends MY_Controller
{
    function __construct()
    {
        parent::__construct();

        must_login();   
    }



function add()
    {
        
        if ($this->form_validation->run('feedback/add') == TRUE){

            $message      = $this->input->post('message', TRUE);

           $this->feedback_model->create($message);

            $this->session->set_flashdata('feedback', get_alert('success', 'Feedback berhasil dikirimkan.'));
            redirect('feedback/add');

        }

        $this->twig->display('tambah-feedback.html');
    }
}
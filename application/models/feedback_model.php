<?php



class Feedback_model extends CI_Model
{
    
 /**
     * Method untuk membuat data feedback
     *
     * @param  string  $message
     */
    public function create($message = null)
    {
        $data = array(
            'message' => $message
        );
       $this->db->insert('feedback', $data);
       return $this->db->insert_id();
    }


}
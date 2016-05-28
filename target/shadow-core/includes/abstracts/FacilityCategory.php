<?php 

use \WeDevs\ORM\Eloquent\Model as Model;

class FacilityCategory extends Model {

    public $primaryKey = 'id';
    public $table = 'facilitycategory';
    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;


    /**
     * 
     */
    public function category()
    {
        return $this->hasMany('FacilityType');
    }

}

?>
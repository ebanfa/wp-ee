<?php 

use \WeDevs\ORM\Eloquent\Model as Model;

class FacilityType extends Model {

    public $primaryKey = 'id';
    public $table = 'facilitytype';
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
        return $this->belongsTo('FacilityCategory');
    }
    /**
     * 
     */
    public function business_category()
    {
        return $this->belongsTo('BusinessCategory');
    }

    /**
     * 
     */
    public function f_type()
    {
        return $this->hasMany('Facility');
    }

}

?>
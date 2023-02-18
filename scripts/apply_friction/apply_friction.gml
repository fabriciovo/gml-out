/// @description apply_friction(amount)
/// @param amount
function apply_friction(_amount){
if (hsp_ != 0) {
    if(abs(hsp_)-_amount > 0){
        hsp_ -= _amount*image_xscale;
    }else{
        hsp_ = 0;
    }
}

}
module color_object::color_object_system{
    use color_object::color_object_schema::{Self, ColorObject};

    public fun new(red: u8, green: u8, blue: u8, ctx: &mut TxContext): ColorObject{
        let mut color_object = color_object_schema::create(ctx);
        color_object.borrow_mut_red().mutate!(|value| *value = red);
        color_object.borrow_mut_green().mutate!(|value| *value = green);
        color_object.borrow_mut_blue().mutate!(|value| *value = blue);
        color_object
    }

    public fun get_color(color_object: &ColorObject): (u8, u8, u8){
        let red = color_object.borrow_red().get();
        let green = color_object.borrow_green().get();
        let blue = color_object.borrow_blue().get();
        (red, green, blue)
    }

    public fun copy_into(from: &ColorObject, into: &mut ColorObject){
        into.borrow_mut_red().mutate!(|red| *red = from.borrow_red().get());
        into.borrow_mut_green().mutate!(|green| *green = from.borrow_green().get());
        into.borrow_mut_blue().mutate!(|blue| *blue = from.borrow_blue().get());
    }

    //fixme: no delete fun in schema
    // public fun delete(object: ColorObject){
    //     let ColorObject { id, red: _, green: _, blue: _ } = object;
    //     object::delete(id);
    // }

    public fun update(object: &mut ColorObject, red: u8, green: u8, blue: u8){
        object.borrow_mut_red().mutate!(|value| *value = red);
        object.borrow_mut_green().mutate!(|value| *value = green);
        object.borrow_mut_blue().mutate!(|value| *value = blue);
    }

}
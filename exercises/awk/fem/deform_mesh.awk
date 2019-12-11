BEGIN{scale["x"]=10.0;scale["y"]=0.5;amplitude=0.25;pi=3.1415927;}
{
    # point 4
    print $1,$2,$3*scale["x"], $4*scale["y"], $5
    # point 6    
    #print $1,$2,$3*scale["x"], $4*(scale["y"] + amplitude*cos($3*2.0*pi)), $5
}

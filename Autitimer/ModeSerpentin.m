//
//  ModeRond.m
//  Autitimer
//
//  Created by Piret on 03/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeSerpentin.h"
#import "ModeSerpentinViewController.h"

#import "ClassiqueModeViewController.h"

NSTimer *myTimer;

@implementation ModeSerpentin
@synthesize textfield;

@synthesize labelChronoSecondes, labelChronoMinutes, labelChronoHeures,audioPlayer;



-(void)initialisation{
    // permet de ne pas relancer le chrono et d'apeller deux fois "chrono" si on retouche le bouton chrono
    //la variable passe sert à entrer dans la boucle pour dessiner l'avancement progeressive ,une fois on a atteint l'extrémité passe1=0 et on active la deuxiéme boucle pour dessiner le segment suivant
    passe1=1;
    //calcul spéciale pour les segements horizentales de droite à gauche on doit soustraire au lieu d'additionner
    k3=223.2;k7=223.2;k11=223.2;
    //affecter les distance de segments
    distanceSegment1=110.8;distanceSegment2=40.6;distanceSegment3=166;distanceSegment4=39;distanceSegment5=167;distanceSegment6=45.1;distanceSegment7=166;distanceSegment8=40;distanceSegment9=167;distanceSegment10=42.6;distanceSegment11=166;distanceSegment12=46.1;distanceSegment13=84.8;
    //affecter les pourcentage relative à la distance des segment par rapport u chemain complet de l'extrémité à l'autre 
    pourcentage1=0.08649492583918814;         
    pourcentage2=0.03169398907103825; 
    pourcentage3=0.12958626073380172; 
    pourcentage4=0.03044496487119438;
    pourcentage5=0.13036690085870414;  
    pourcentage6=0.035206869633099144;
    pourcentage7=0.12958626073380172; 
    pourcentage8=0.0312256049960968;
    pourcentage9=0.13036690085870414;
    pourcentage10=0.03325526932084309;
    pourcentage11=0.12958626073380172;
    pourcentage12=0.035987509758001565;
    pourcentage13=0.06619828259172521;
    b=0.04;
    
    // On a établit une formule pour calculer les pas
    //on va vous montrer les étapes qui ont donné naissance à cette formule
    /* 
     pourcentage du segment de la totalité du segment 
     
     on a d'abord utilisé les distance entre les segment en calculant la différence entre les abscisse ou ordonnées des points d'extrémité de chaque segement donc pour les 
     13 segments
     une fois qu'on a calculer la totalité du chemin pour avoir le pourcentage on divise 
     
     1.pourcentage=la longueur du chemin /la totalité 
     
     pour avoir la durée nécessaire pour parcourir chaque segment : 
     
     2.Durée Segment=Durée totale(a) * le pourcentage
     
     sachant qu'on appelle le Timer chaque b seconde (0.04 seconde)
     On doit savoir combien de fois on doit appeler le Timer pour atteindre la durée du segment 
     
     3.nombre d'appel Timer=durée segment/b
     
     4.distance du segment=(borne supérieure - borne inférieure )
     
     
     5.pas=distance du segment/nombre d'appel Timer
     
     
     on optimisant la formule du pas et en remplacent chaque  paramètre par sa formule dans la formule pas on obtient cette formule:
     
     pasx=(distanceSegmentx*b)/(a*pourcentagex);
     avec x le nombre de la zone donc on doit établir cette formule pour les 13 zones(verticale et horizentale).
     
     */
    pas1=(distanceSegment1*b)/(a*pourcentage1);
    
    pas2=(distanceSegment2*b)/(a*pourcentage2);
    pas3=(distanceSegment3*b)/(a*pourcentage3);
    pas4=(distanceSegment4*b)/(a*pourcentage4);
    pas5=(distanceSegment5*b)/(a*pourcentage5);
    pas6=(distanceSegment6*b)/(a*pourcentage6);
    pas7=(distanceSegment7*b)/(a*pourcentage7);
    pas8=(distanceSegment8*b)/(a*pourcentage8);
    pas9=(distanceSegment9*b)/(a*pourcentage9);
    pas10=(distanceSegment10*b)/(a*pourcentage10);
    pas11=(distanceSegment11*b)/(a*pourcentage11);
    pas12=(distanceSegment12*b)/(a*pourcentage12);
    pas13=(distanceSegment13*b)/(a*pourcentage13);
    


}
- (IBAction)pushTop :(id)sender {
    
  
    if(touch==0)
    {[self initialisation];
        touch=1;
    }
    
    
    if(touchChrono==1)
    {    
        [myTimer invalidate]; 
        
        
        
        
        
    }
    
    
    
    
    if(touchChrono==0)
    {
        

        myTimer=[NSTimer scheduledTimerWithTimeInterval: (b) target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
        
    }
    
    if(touchChrono==1)
        touchChrono=0;
    else
        touchChrono=1;
}





- (id)initWithFrame:(CGRect)frame
{         self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.


- (void)drawRect:(CGRect)rect
{   CGContextRef context3 = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context3, 27.7);
    
    CGColorSpaceRef colorspace1 = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components1[] = { 0x96/255.0, 0x83/ 255.0, 0xec/ 255.0, 0.3};
    
    CGColorRef color1 = CGColorCreate(colorspace1, components1);
    
    CGContextSetStrokeColorWithColor(context3, color1);
    //première ligne horizental
    CGContextMoveToPoint(context3,139.2 , 122);
    CGContextAddLineToPoint(context3, 250, 122);
    //deuxième ligne verticale
    CGContextMoveToPoint(context3,237 , 134.3);
    CGContextAddLineToPoint(context3, 237, 174.9);
    //trosième ligne horizentale
    CGContextMoveToPoint(context3,223.2 , 160.8);
    CGContextAddLineToPoint(context3, 57.2, 160.8);
    //quatriéme ligne verticale
    CGContextMoveToPoint(context3,70 , 174.7);
    CGContextAddLineToPoint(context3, 70, 213.7);
    //cinquiéme ligne horizentale
    CGContextMoveToPoint(context3,83 , 204.0);
    CGContextAddLineToPoint(context3, 250, 204.0);
    //sixiéme ligne verticale
    CGContextMoveToPoint(context3,237 , 210.7);
    CGContextAddLineToPoint(context3, 237, 255.8);
    //sept éme ligne horizentale
    CGContextMoveToPoint(context3,223.2 , 242.0);
    CGContextAddLineToPoint(context3, 57.2, 242.0);
    //8 éme ligne verticale
    CGContextMoveToPoint(context3,70 , 255.9);
    CGContextAddLineToPoint(context3, 70, 295.9);
    //9 éme ligne horizentale
    CGContextMoveToPoint(context3,83 , 280.0);
    CGContextAddLineToPoint(context3, 250, 280.0);
    //10 éme ligne verticale
    CGContextMoveToPoint(context3,237 , 283.9);
    CGContextAddLineToPoint(context3, 237, 336.5);
    //11 éme ligne horizentale
    CGContextMoveToPoint(context3,223.2 , 320.0);
    CGContextAddLineToPoint(context3, 57.2, 320.0);
    //12 éme ligne vertical
    CGContextMoveToPoint(context3,70 , 333.9);
    CGContextAddLineToPoint(context3, 70.2, 380.0);
    //13 éme ligne
    CGContextMoveToPoint(context3,84 , 363.0);
    CGContextAddLineToPoint(context3, 167.8, 363.0);
    
    CGContextStrokePath(context3);
    CGColorSpaceRelease(colorspace1);
    CGColorRelease(color1);

    
   if(p!=0) 
       //On a diviser notre forme en 13 parties de lignes verticale et horizentale
       //mémes les formes identiques n'on pas les mémes coordonnées puisque l'établissement des coordonnées s'est basé sur le tatonement
       //a c'est le temps que le camembert doit respecter pour parcourir chaque forme quelqu'elle soit
       //on a passer ce paramétre dans la méthode de l'appel de la page
   {if (a >= (decompte) ) {

        //convertir du type float vers string et l'afficher dans le label correspendant
        labelChronoSecondes.text = [NSString stringWithFormat:@"%.f", chronoSecondes];
        chronoSecondes = chronoSecondes + b;
       //decompte sert  à enregistrer le temps passé c'est pourquoi chaque fois on l'incrémente de b puisque le Timer appel la méthode drawRect chaque b secondes donc dans notre cas chaque 0.04
        decompte = decompte + b;
        
        labelChronoMinutes.text = [NSString stringWithFormat:@"%.f", chronoMinutes];
        labelChronoHeures.text = [NSString stringWithFormat:@"%.f", chronoHeures];
        
        if (chronoSecondes >= 60) {
            chronoSecondes = 0;
            chronoMinutes = chronoMinutes + 1;
        }
        if (chronoMinutes >= 60) {
            chronoMinutes = 0;
            chronoHeures = chronoHeures + 1;
        }
       
       
       

       
    

        
            CGContextRef context = UIGraphicsGetCurrentContext();
       

       
            CGContextSetLineWidth(context, 27.7);
            
            CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
           
            CGFloat components[] = {   255, 255, 255, 1};
         
            CGColorRef color = CGColorCreate(colorspace, components);
            
            CGContextSetStrokeColorWithColor(context, color);
            
            //première ligne horizentale
       
       CGContextMoveToPoint(context,139.2 , 122);
       if(passe1==1)
           // (a*pourcentage) c'est le temps nécessaire pour parcourir un segment donné des 13 segments
       {if(b1<(a*pourcentage1))
       {   // la variable b sert a stocké le temps pour pouvoir le comparé à la durée du parcourt du segment et sortir de la boucle si le temps est atteint 
           b1=b1+0.04;
           k=k+pas1;
           //puisque c'est une ligne horizentale on va incrémenter le premièr paramètre en ajoutant chaque fois un pas qu'on a déjà calculer en utilisant la formule 
            CGContextAddLineToPoint(context, 139.2+k, 122);
 
           
       }
       if(b1>(a*pourcentage1))
       { 
           CGContextAddLineToPoint(context, 250, 122);
           passe1=0;
           passe2=1;
           // on utilise la variable complet pour indiquer que le parcourt du segment est complet et qu'on doit dessiner le segment tout entier pour paraitre a l'oeil sans que l'utilisateur le remarque puisque l'utilisateur ne peut pas capter 25 images par seconde il l'a voit comme une seule image
           complet1=1;
       }}
       if(complet1==1)
       { CGContextMoveToPoint(context,139.2 , 122);
       CGContextAddLineToPoint(context, 250, 122);  
       }
       //deuxième ligne verticale
   if(passe2==1)
   { CGContextMoveToPoint(context,237 , 134.3);
       if(b2<(a*pourcentage2))
       {b2=b2+0.04;
           k2=k2+pas2;
           CGContextAddLineToPoint(context, 237, 134.3+k2);
           
          }
           if(b2>(a*pourcentage2))
           {  
               CGContextAddLineToPoint(context, 237, 174.9);
               passe2=0;
               passe3=1;
               complet2=1;}
   } 
       if(complet2==1)
   {  CGContextMoveToPoint(context,237 , 134.3);
       CGContextAddLineToPoint(context, 237, 174.9);
   }
       
    //troisiéme ligne horizentale
if(passe3==1)
{
      CGContextMoveToPoint(context,223.2  , 160.8);
    if(b3<(a*pourcentage3))
    {b3=b3+0.04;
        k3=k3-pas3;
          
        CGContextAddLineToPoint(context, k3, 160.8);
 }
    if(b3>(a*pourcentage3))
    {CGContextAddLineToPoint(context, 57.2, 160.8);
        passe3=0;
        passe4=1;
        complet3=1;
    }
  
}    
       if(complet3==1)
       { CGContextMoveToPoint(context,223.2 , 160.8);
           CGContextAddLineToPoint(context, 57.2, 160.8);
       }
       //quatriéme ligne verticale
       
       if(passe4==1)
       { CGContextMoveToPoint(context,70 , 174.7);
           
           if(b4<(a*pourcentage4))
           {b4=b4+0.04;
               k4=k4+pas4;
               CGContextAddLineToPoint(context, 70, 174.7+k4);
}
           if(b4>(a*pourcentage4))
           {  
               CGContextAddLineToPoint(context, 70,  213.7);
               passe4=0;
               passe5=1;
               complet4=1;}
       } 
       if(complet4==1)
       {  CGContextMoveToPoint(context,70 , 174.7);
           CGContextAddLineToPoint(context, 70,  213.7);
       }
       
       
       
       
       //cinquiéme ligne horizentale
    
      
       if(passe5==1)
       { CGContextMoveToPoint(context,83 , 204);
           if(b5<(a*pourcentage5))
           {  b5=b5+0.04;
           k5=k5+pas5;
           CGContextAddLineToPoint(context, 83+k5, 204);
}
           if(b5>(a*pourcentage5))
           { 
               CGContextAddLineToPoint(context, 250, 204);
               passe5=0;
               passe6=1;
               complet5=1;
           }}
       if(complet5==1)
       { CGContextMoveToPoint(context,83 , 204);
           CGContextAddLineToPoint(context, 250, 204);  
       }
       
       
       
       
       //sixiéme ligne verticale
       
       if(passe6==1)
       { CGContextMoveToPoint(context,237 , 210.7);
           if(b6<(a*pourcentage6))
           {b6=b6+0.04;
               k6=k6+pas6;
               CGContextAddLineToPoint(context, 237, 210.7+k6);
           }
           if(b6>(a*pourcentage6))
           {  
               CGContextAddLineToPoint(context, 237, 255.8 );
               passe6=0;
               passe7=1;
               complet6=1;}
       } 
       if(complet6==1)
       {  CGContextMoveToPoint(context,237 , 210.7);
           CGContextAddLineToPoint(context,237,  255.8);
       }
       
       
       
       
            //sept éme ligne horizentale
     
       if(passe7==1)
       {
           CGContextMoveToPoint(context,223.2  , 242);
           if(b7<(a*pourcentage7))
           {b7=b7+0.04;
               k7=k7-pas7;
               
               CGContextAddLineToPoint(context, k7, 242);
}
           if(b7>(a*pourcentage7))
           {CGContextAddLineToPoint(context, 57.2,242);
               passe7=0;
               passe8=1;
               complet7=1;
           }
           
       }    
       if(complet7==1)
       { CGContextMoveToPoint(context,223.2 , 242);
           CGContextAddLineToPoint(context, 57.2,242);
       }
       
       
       
       
       
            //8 éme ligne verticale       
       
       if(passe8==1)
       { CGContextMoveToPoint(context,70 , 255.9);
           if(b8<(a*pourcentage8))
           {b8=b8+0.04;
               k8=k8+pas8;
               CGContextAddLineToPoint(context, 70, 255.9+k8);
}
           if(b8>(a*pourcentage8))
           {  
               CGContextAddLineToPoint(context, 70,  295.9);
               passe8=0;
               passe9=1;
               complet8=1;}
       } 
       if(complet8==1)
       {  CGContextMoveToPoint(context,70 , 255.9);
           CGContextAddLineToPoint(context, 70,  295.9);
       }

       
            //9 éme ligne horizentale 
       
 
       if(passe9==1)
       { CGContextMoveToPoint(context,83 , 280);
           if(b9<(a*pourcentage9))
           {  b9=b9+0.04;
               k9=k9+pas9;
               CGContextAddLineToPoint(context, 83+k9,280);

           }
           if(b9>(a*pourcentage9))
           { 
               CGContextAddLineToPoint(context, 250, 280);
               passe9=0;
               passe10=1;
               complet9=1;
           }}
       if(complet9==1)
       { CGContextMoveToPoint(context,83 , 280);
           CGContextAddLineToPoint(context, 250, 280);  
       }

            //10 éme ligne verticale 
     
       
       if(passe10==1)
       { CGContextMoveToPoint(context,237  , 293.9);
           if(b10<(a*pourcentage10))
           {
               b10=b10+0.04;
               
               k10=k10+pas10;
               CGContextAddLineToPoint(context,237 , 293.9+k10);
}
           if(b10>(a*pourcentage10))
           {  
               CGContextAddLineToPoint(context,237 ,  336.5);
               passe10=0;
               passe11=1;
               complet10=1;}
       } 
       if(complet10==1)
       {  CGContextMoveToPoint(context,237  , 293.9);
           CGContextAddLineToPoint(context,237 ,  336.5);
       }
       
       
            //11 éme ligne horizentale

       if(passe11==1)
       {
           CGContextMoveToPoint(context,223.2  , 320);
           if(b11<(a*pourcentage11))
           {b11=b11+0.04;
               k11=k11-pas11;
               
               CGContextAddLineToPoint(context, k11, 320);}
           if(b11>(a*pourcentage11))
           {CGContextAddLineToPoint(context, 57.2,320);
               passe11=0;
               passe12=1;
               complet11=1;
           }
           
       }    
       if(complet11==1)
       { CGContextMoveToPoint(context,223.2 , 320);
           CGContextAddLineToPoint(context, 57.2,320);
       }
       
       
       
       //12 éme ligne vertical
    
       if(passe12==1)
       { CGContextMoveToPoint(context,70 , 333.9);
           if(b12<(a*pourcentage12))
           {b12=b12+0.04;
               k12=k12+pas12;
               CGContextAddLineToPoint(context, 70, 333.9+k12);}
           if(b12>(a*pourcentage12))
           {  
               CGContextAddLineToPoint(context, 70,  380.0);
               passe12=0;
               passe13=1;
               complet12=1;}
       } 
       if(complet12==1)
       {  CGContextMoveToPoint(context,70 ,333.9);
           CGContextAddLineToPoint(context, 70,  380.0);
       }

       
       
       
       
       
            //13 éme ligne horizentale
      

       
       if(passe13==1)
       { CGContextMoveToPoint(context,83 , 363.0);
           if(b13<=(a*pourcentage13))
           {  b13=b13+0.04;
               k13=k13+pas13;
               CGContextAddLineToPoint(context, 83+k13,363.0);

           }
           if(b13>(a*pourcentage13))
           { 
               CGContextAddLineToPoint(context, 167.8, 363.0);
               passe13=0;
               
               complet13=1;
           }}
       if(complet13==1)
       { CGContextMoveToPoint(context,83 , 363.0);
           CGContextAddLineToPoint(context, 167.8, 363.0);  
       }
            CGContextStrokePath(context);
            CGColorSpaceRelease(colorspace);
            CGColorRelease(color);            
            
            
        
        
    }
    
    else {
        
        //la derniére seconde est déja incrémenter dans le premier if mais elle n'est pas stocké puisque les instruction de stockage viennenet avant l'incrémentation
        if(g==0)
        { 
            
            labelChronoSecondes.text = [NSString stringWithFormat:@"%.f", chronoSecondes];
            labelChronoMinutes.text = [NSString stringWithFormat:@"%.f", chronoMinutes];
            labelChronoHeures.text = [NSString stringWithFormat:@"%.f", chronoHeures];
            
            g=g+1;
            
            
            
        }
//
//        label.text = @"fini";
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetLineWidth(context, 27.7);
        
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        
        CGFloat components[] = {255.0, 255.0, 255.0, 1.0};
        
        CGColorRef color = CGColorCreate(colorspace, components);

        CGContextSetStrokeColorWithColor(context, color);
        //première ligne horizental
        CGContextMoveToPoint(context,139.2 , 122);
        CGContextAddLineToPoint(context, 250, 122);
        //deuxième ligne verticale
        CGContextMoveToPoint(context,237 , 134.3);
        CGContextAddLineToPoint(context, 237, 174.9);
        //trosième ligne horizentale
        CGContextMoveToPoint(context,223.2 , 160.8);
        CGContextAddLineToPoint(context, 57.2, 160.8);
        //quatriéme ligne verticale
        CGContextMoveToPoint(context,70 , 174.7);
        CGContextAddLineToPoint(context, 70, 213.7);
        //cinquiéme ligne horizentale
        CGContextMoveToPoint(context,83 , 204.0);
        CGContextAddLineToPoint(context, 250, 204.0);
        //sixiéme ligne verticale
        CGContextMoveToPoint(context,237 , 210.7);
        CGContextAddLineToPoint(context, 237, 255.8);
        //sept éme ligne horizentale
        CGContextMoveToPoint(context,223.2 , 242.0);
        CGContextAddLineToPoint(context, 57.2, 242.0);
        //8 éme ligne verticale
        CGContextMoveToPoint(context,70 , 255.9);
        CGContextAddLineToPoint(context, 70, 295.9);
        //9 éme ligne horizentale 
        CGContextMoveToPoint(context,83 , 280.0);
        CGContextAddLineToPoint(context, 250, 280.0);
        //10 éme ligne verticale 
        CGContextMoveToPoint(context,237 , 283.9);
        CGContextAddLineToPoint(context, 237, 336.5);
        //11 éme ligne horizentale
        CGContextMoveToPoint(context,223.2 , 320.0);
        CGContextAddLineToPoint(context, 57.2, 320.0);
        //12 éme ligne vertical
        CGContextMoveToPoint(context,70 , 333.9);
        CGContextAddLineToPoint(context, 70.2, 380.0);
        //13 éme ligne
        CGContextMoveToPoint(context,84 , 363.0);
        CGContextAddLineToPoint(context, 167.8, 363.0);
        
        CGContextStrokePath(context);
        CGColorSpaceRelease(colorspace);
        CGColorRelease(color);            
////        
        //jouer un son à la fin
       
    }}p++;
    
}




@end

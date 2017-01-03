<div class="box">
<?php
$this->language->load('module/category');
$button_compare = $this->language->get('button_compare');
$button_wishlist = $this->language->get('button_wishlist');
$this->language->load('module/mattimeotheme');
$button_quick = $this->language->get('entry_quickview');
?>
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  <div class="box-product">
  
<?php if ( (isset($position)) && ($position == 'column_left' || $position == 'column_right')){ ?> 
 
       <?php if ($this->config->get('showmore2_bestseller') == '1')  { ?>
       <!--Carousel products--> 
         <section  class="list_carousel" id="bestseller_scroll2">
         <div class="carou">
        <?php } ?> 
         
      
 <?php } else { ?>
 
      <?php if ($this->config->get('showmore_bestseller') == '1')  { ?>
       <!--Carousel products--> 
         <section  class="list_carousel content_carou" id="bestseller_scroll">
         <div class="carou">
         
       
         
       <?php } ?>
       
 <?php } ?>
 
        
         <?php foreach ($products as $product) { ?>
               <div class="itemcolumns">
               <div>
               
                <div class="img_but">
               <?php if ($product['thumb']) { ?>
               
               <?php if  ($this->config->get('img_additional1') == '1') { ?> 
               <!--Additional images--> 
               <div class="owl-addimage owl-carousel"> <?php } ?>
               
               <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" ></a></div>
                
               <?php if ((isset($product['dop_img'])) && ($this->config->get('img_additional1') == '1') ) { ?> 
               <?php foreach ($product['dop_img'] as $img) { ?>
               <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $img;?>" alt="<?php echo $product['name']; ?>"></a></div>
               <?php } ?>
               <?php } ?>
                
        
                <?php if  ($this->config->get('img_additional1') == '1') { ?>  
                <!--end additional images--> 
                </div> <?php } ?>
                <?php } ?>
                <div class="sticker-img"><?php echo $product['sticker']; ?></div>
                <div class="hover_but">
               <?php if ($this->config->get('show_wishlist') == '1')  { ?>
               <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>" ></a></div>
               <?php } ?>
               <?php if ($this->config->get('show_compare') == '1')  { ?>
               <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_compare; ?>"></a></div>
               <?php } ?>
               <?php if  ((isset($product['quickview'])) && ($this->config->get('quick_view') == '1')) { ?>  
               <div class="quickviewbutton"><a class='quickview' href="<?php echo $product['quickview']; ?>" title="<?php echo $button_quick; ?>"></a></div>
               <?php } ?> 
               </div>
               </div>
               
               <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
               <?php if ($product['price']) { ?>
               <div class="price">
               <?php if (!$product['special']) { ?>
               <?php echo $product['price']; ?>
               <?php } else { ?>
               <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
               <?php } ?>
               </div>
               <?php } ?>
              
              <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
              
                  <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
              
             
        </div>
        </div>
      <?php } ?>
      
      
      
 <?php if ( (isset($position)) && ($position == 'column_left' || $position == 'column_right')){ ?> 
 
       <?php if ($this->config->get('showmore2_bestseller') == '1')  { ?> 
        <!--Carousel products--> 
       </div>
       <div class="clearfix"></div>
				<a class="prev" href="#"></a>
				<a class="next" href="#"></a>
        </section>
       <!--end Carousel products--> 
        <?php } ?> 
          
       <?php } else { ?> 
       
     <?php if ($this->config->get('showmore_bestseller') == '1')  { ?>
     <!--Carousel products--> 
     </div>
     <div class="clearfix"></div>
				<a class="prev" href="#"></a>
				<a class="next" href="#"></a>
     </section>
     <!--end Carousel products--> 
     
      
     <?php } ?>  
     <?php } ?> 
     
    <?php if ($this->config->get('showmore_bestseller') == '1')  { ?> 
    
          <?php if (isset($height_box))  { ?> 
		  <script type="text/javascript">    
		 $('#bestseller_scroll .itemcolumns').css('min-height', <?php echo $height_box; ?>);
		 </script>
		 <?php } ?>     
         <script type="text/javascript"> 
		  $(document).ready(function(){
		$('#bestseller_scroll .carou').carouFredSel({
			prev: '#bestseller_scroll .prev',
			next: '#bestseller_scroll .next',
			scroll: 1,
			swipe:{onTouch: true},
			auto: false,
			responsive: true,
			items: {
			width: 290,
			visible: {
			min: 1,
			max: 5
					}
				}
		});
		});
	</script>
    <?php } ?>  
     <?php if (($this->config->get('showmore2_bestseller') == '1') && ((isset($position)) && ($position == 'column_left' || $position == 'column_right')))  { ?> 
    
          <?php if (isset($height_box))  { ?> 
		  <script type="text/javascript">    
		 $('#bestseller_scroll2 .itemcolumns').css('min-height', <?php echo $height_box; ?>);
		 </script>
		 <?php } ?>     
         <script type="text/javascript"> 
		  $(document).ready(function(){
		$('#bestseller_scroll2 .carou').carouFredSel({
			prev: '#bestseller_scroll2 .prev',
			next: '#bestseller_scroll2 .next',
			scroll: 1,
			swipe:{onTouch: true},
			auto: false,
			responsive: true,
			items: {
			width: 290,
			visible: {
			min: 1,
			max: 5
					}
				}
		});
		});
	</script>
    <?php } ?>  
   </div>
   </div>    
         
         
  </div>  


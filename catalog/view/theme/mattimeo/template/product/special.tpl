<?php
$this->language->load('module/mattimeotheme');
$button_quick = $this->language->get('entry_quickview');
?>
<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
 <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
    <div class="limit"><?php echo $text_limit; ?>
      <select onchange="location = this.value;" class="select1">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort">
      <select onchange="location = this.value;" class="select1">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
     <?php if ($this->config->get('show_compare') == '1')  { ?>
    <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><div></div><?php echo $text_compare; ?></a></div>
    <?php } ?>
  </div>
 
   <div class="product-list">
    <?php foreach ($products as $product) { ?>
   
       <div class="item">
       
       <?php if ($product['thumb']) { ?> 
       
           <?php if  ($this->config->get('img_additional2') == '1') { ?> 
               <!--Additional images--> 
           <div class="owl-addimagecat owl-carousel"> <?php } ?>
               
         <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" ></a></div>
           
           <?php if ((isset($product['dop_img'])) && ($this->config->get('img_additional2') == '1')) { ?> 
           <?php foreach ($product['dop_img'] as $key => $img) { ?>
               <div class="image image<?php echo $key;?>"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $img;?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"></a></div>
           <?php } ?>
           <?php } ?>
           
           <?php if  ($this->config->get('img_additional2') == '1') { ?>  
            <!--end additional images--> 
            </div> <?php } ?>
            
           <?php } ?> 
     
     <div class="sticker-img"><?php echo $product['sticker']; ?></div>
     <div class="name">
      <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description">
       <?php if (!$product['description_mini']) { ?>
		<?php echo $product['description']; ?>
			<?php } else { ?>
		<?php echo $product['description_mini']; ?>
      <?php } ?>
      </div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>

        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php if (isset($product['saving'])) { ?>
              <div  class="savemoney">- <?php echo $product['saving']; ?>%</div>
           <?php } ?>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
     
      <div class="cart">
        <a href="<?php echo $product['href']; ?>" class="button">КУПИТЬ</a>
      </div>
 <div class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
	  </div>
      				<?php if ($product['benefits']) { ?>
					<div class="benefit-text"><?php echo $text_benefits; ?></div>
					<div class="benefits">
					<ul class="benefit">
					<?php foreach ($product['benefits'] as $benefit) { ?>	
						<?php if ($benefit['type'] == 1) { ?>
							<li>
								<?php if (!$benefit['link']) { ?>
								   <span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
								<?php } else { ?> 
								   <a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
								<?php } ?>
								<?php if ($benefit['description']) { ?>
								<div class="benefit_description"><?php echo $benefit['description']; ?></div>
								<?php } ?>
							</li>
						<?php } ?> 
					<?php } ?>
					</ul>
					</div>
					<div class="present">
						<?php foreach ($product['benefits'] as $benefit) { ?>	
							<?php if ($benefit['type'] == 0) { ?>
								<div>
									<?php if (!$benefit['link']) { ?>
										<span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
									<?php } else { ?> 
										<a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
									<?php } ?>
								</div>
							<?php } ?> 
						<?php } ?>
					</div>
				<?php } ?>
             <div class="hover_but">
               <?php if ($this->config->get('show_wishlist') == '1')  { ?>
               <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>"></a></div>
               <?php } ?>
               <?php if ($this->config->get('show_compare') == '1')  { ?>
               <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_compare; ?>"></a></div>
               <?php } ?>
               <?php if  ((isset($product['quickview'])) && ($this->config->get('quick_view') == '1')) { ?>  
               <div class="quickviewbutton"><a class='quickview' href="<?php echo $product['quickview']; ?>" title="<?php echo $button_quick; ?>"></a></div>
               <?php } ?> 
               </div>
       
      
    </div>
    <?php } ?>

  </div>
  
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?> 
  <?php echo $content_bottom; ?></div>
    <div class="cont_bottom"></div>
 
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			
			
			html  = '<div class="left">';
			html += '  <div class="sticker-img">' + $(element).find('.sticker-img').html() + '</div>';
			 <?php if  ($this->config->get('img_additional2') == '1') { ?> 
			html += '<div class="owl-addimagecat owl-carousel">';
		   <?php } ?>
			
			var image = $(element).find('.image').html();
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			<?php if  ($this->config->get('img_additional2') == '1') { 
			for ($key = 0; $key < 6; $key++) { ?>
			var image2 = $(element).find('.image<?php echo $key;?>').html();
			if (image2 != null) { 
			html += ' <div class="image image<?php echo $key;?>">' + image2 + '</div>';
			
			}
			<?php } ?>
			
			html += '</div>';
			<?php } ?>
			
			html += '</div>';
					
			html += '<div class="centr">';

			html += ' <div class="name">' + $(element).find('.name').html() + '</div>';
			
					
			
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			//benefits
			var benefit = $(element).find('.benefit').html();
			
			if (benefit != null) {
				html += '<div class="benefit-text"><?php echo $text_benefits; ?></div>';
				html += '  <div class="benefit">' + $(element).find('.benefit').html() + '</div>';
			}
			//benefits

			//benefits present
			var present = $(element).find('.present').html();
			
			if (present != null) {
				html += '  <div class="present">' + $(element).find('.present').html() + '</div>';
			}
			//benefits present
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			html += '</div>';
				
		    html += '<div class="right">';
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			
             html += ' <div class="hover_but">';
			<?php if ($this->config->get('show_wishlist') == '1')  { ?>
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			<?php } ?>
			<?php if ($this->config->get('show_compare') == '1')  { ?>
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			<?php } ?>
		    <?php if  ((isset($product['quickview'])) && ($this->config->get('quick_view') == '1')) { ?>  
             html += ' <div class="quickviewbutton">' + $(element).find('.quickviewbutton').html() + '</div>';
            <?php } ?>
			html += '</div>';
			
			html += '</div>';
						
			$(element).html(html);
		});	
		 $(".owl-addimagecat").owlCarousel({ navigation : true, pagination : false, singleItem : true });	
		
		$('.display').html('<span class="iconlist"></span> <a onclick="display(\'grid\');" class="icongrid"></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			html += '<div class=img_but>';
			html += '  <div class="sticker-img">' + $(element).find('.sticker-img').html() + '</div>';
		   <?php if  ($this->config->get('img_additional2') == '1') { ?> 
			html += '<div class="owl-addimagecat owl-carousel">';
		   <?php } ?>
			
			var image = $(element).find('.image').html();
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			<?php if  ($this->config->get('img_additional2') == '1') { 
			for ($key = 0; $key < 6; $key++) { ?>
			var image2 = $(element).find('.image<?php echo $key;?>').html();
			if (image2 != null) { 
			html += ' <div class="image image<?php echo $key;?>">' + image2 + '</div>';
			
			}
			<?php } ?>
			
			html += '</div>';
			<?php } ?>
			
			html += ' <div class="hover_but">';
			<?php if ($this->config->get('show_wishlist') == '1')  { ?>
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			<?php } ?>
			<?php if ($this->config->get('show_compare') == '1')  { ?>
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			<?php } ?>
		    <?php if  ((isset($product['quickview'])) && ($this->config->get('quick_view') == '1')) { ?>  
             html += ' <div class="quickviewbutton">' + $(element).find('.quickviewbutton').html() + '</div>';
            <?php } ?>
			html += '</div>'; 
			html += '</div>';
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			//benefits
			var benefit = $(element).find('.benefit').html();
			
			if (benefit != null) {
				html += '<div class="benefit-text"><?php echo $text_benefits; ?></div>';
				html += '  <div class="benefit">' + $(element).find('.benefit').html() + '</div>';
			}
			//benefits
			//benefits present
			var present = $(element).find('.present').html();
			
			if (present != null) {
				html += '  <div class="present">' + $(element).find('.present').html() + '</div>';
			}
			//benefits present
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';	
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			
			$(element).html(html);
		});	
		 $(".owl-addimagecat").owlCarousel({ navigation : true, pagination : false, singleItem : true });		
		$('.display').html('<a onclick="display(\'list\');" class="iconlist"></a> <span class="icongrid"></span>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script>
 
<?php echo $footer; ?>
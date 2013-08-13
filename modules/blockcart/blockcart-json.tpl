{*
* =|= BLOCK CART JSON ==========================================
* JSON Data to be read by Block Cart
* ==============================================================
*}

{ldelim}
"products": [
{if $products}
{foreach from=$products item=product name='products'}
{assign var='productId' value=$product.id_product}
{assign var='productAttributeId' value=$product.id_product_attribute}
	{ldelim}
		"id":            {$product.id_product},
		"link":          "{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category, null, null, $product.id_shop, $product.id_product_attribute)|addslashes|replace:'\\\'':'\''}",
		"quantity":      {$product.cart_quantity},
		"priceByLine":   "{if $priceDisplay == $smarty.const.PS_TAX_EXC}{displayWtPrice|html_entity_decode:2:'UTF-8' p=$product.total}{else}{displayWtPrice|html_entity_decode:2:'UTF-8' p=$product.total_wt}{/if}",
		"name":          "{$product.name|html_entity_decode:2:'UTF-8'|escape|truncate:15:'...':true}",
		"price":         "{if $priceDisplay == $smarty.const.PS_TAX_EXC}{displayWtPrice|html_entity_decode:2:'UTF-8' p=$product.total}{else}{displayWtPrice|html_entity_decode:2:'UTF-8' p=$product.total_wt}{/if}",
		"price_float":   "{$product.total}",
		"idCombination": {if isset($product.attributes_small)}{$productAttributeId}{else}0{/if},
		"idAddressDelivery": {if isset($product.id_address_delivery)}{$product.id_address_delivery}{else}0{/if},
{if isset($product.attributes_small)}
		"hasAttributes": true,
		"attributes":    "{$product.attributes_small|addslashes|replace:'\\\'':'\''}",
{else}
		"hasAttributes": false,
{/if}
		"hasCustomizedDatas": {if isset($customizedDatas.$productId.$productAttributeId)}true{else}false{/if},

		"customizedDatas":[
		{if isset($customizedDatas.$productId.$productAttributeId[$product.id_address_delivery])}
		{foreach from=$customizedDatas.$productId.$productAttributeId[$product.id_address_delivery] key='id_customization' item='customization' name='customizedDatas'}{ldelim}
{* This empty line was made in purpose (product addition debug), please leave it here *}

			"customizationId":	{$id_customization},
			"quantity":			"{$customization.quantity}",
			"datas": [
				{foreach from=$customization.datas key='type' item='datas' name='customization'}
				{ldelim}
					"type":	"{$type}",
					"datas":
					[
					{foreach from=$datas key='index' item='data' name='datas'}
						{ldelim}
						"index":			{$index},
						"value":			"{$data.value|addslashes|replace: '\\\'':'\''}",
						"truncatedValue":	"{$data.value|truncate:28:'...'|addslashes|replace: '\\\'':'\''}"
						{rdelim}{if !$smarty.foreach.datas.last},{/if}
					{/foreach}]
				{rdelim}{if !$smarty.foreach.customization.last},{/if}
				{/foreach}
			]
		{rdelim}{if !$smarty.foreach.customizedDatas.last},{/if}
		{/foreach}
		{/if}
		]


	{rdelim}{if !$smarty.foreach.products.last},{/if}
{/foreach}{/if}
],

"discounts": [
{if $discounts}{foreach from=$discounts item=discount name='discounts'}
	{ldelim}
		"id":              "{$discount.id_discount}",
		"name":            "{$discount.name|cat:' : '|cat:$discount.description|truncate:18:'...'|addslashes|replace:'\\\'':'\''}",
		"description":     "{$discount.description|addslashes|replace:'\\\'':'\''}",
		"nameDescription": "{$discount.name|cat:' : '|cat:$discount.description|truncate:18:'...'|addslashes|replace:'\\\'':'\''}",
		"link":            "{$link->getPageLink("$order_process", true, NULL, "deleteDiscount={$discount.id_discount}")}",
		"price":           "{if $priceDisplay == 1}{convertPrice|html_entity_decode:2:'UTF-8' price=$discount.value_tax_exc}{else}{convertPrice|html_entity_decode:2:'UTF-8' price=$discount.value_real}{/if}",
		"price_float":     "{if $priceDisplay == 1}{$discount.value_tax_exc}{else}{$discount.value_real}{/if}"
	{rdelim}
	{if !$smarty.foreach.discounts.last},{/if}
{/foreach}{/if}
],

"shippingCost": "{$shipping_cost|html_entity_decode:2:'UTF-8'}",
"shippingCostFloat": "{$shipping_cost_float|html_entity_decode:2:'UTF-8'}",
{if isset($tax_cost)}
"taxCost": "{$tax_cost|html_entity_decode:2:'UTF-8'}",
{/if}
"wrappingCost": "{$wrapping_cost|html_entity_decode:2:'UTF-8'}",
"nbTotalProducts": "{$nb_total_products}",
"total": "{$total|html_entity_decode:2:'UTF-8'}",
"productTotal": "{$product_total|html_entity_decode:2:'UTF-8'}",

{if isset($errors) && $errors}
"hasError" : true,
"errors" : [
{foreach from=$errors key=k item=error name='errors'}
	"{$error|addslashes|html_entity_decode:2:'UTF-8'}"
	{if !$smarty.foreach.errors.last},{/if}
{/foreach}
]
{else}
"hasError" : false
{/if}

{rdelim}
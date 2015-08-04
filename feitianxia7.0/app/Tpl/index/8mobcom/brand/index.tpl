<!doctype html>
<html>
<head>
<include file="public:head" />
<link rel=stylesheet type=text/css href="__STATIC__/8mobcom/css/good.css" />
<link rel=stylesheet type=text/css href="__STATIC__/8mobcom/css/brand.css" />
</head>
<body>
<include file="public:header" />


<div class="bmain {:C('ftx_site_width')} pr mt25 clear">
        <div class="slide-logos clear">
		<span class="prev-btn" style="display: inline;"></span>
		<span class="next-btn" style="display: inline;"></span>
		<div class="logos-box">
			<ul>
			<li>
			<volist name="brands" id="val" mod="20">
				<a href="{:U('brand/dlist',array('uid'=>$val['uid']))}" target="_blank">
					<img alt="{$val.shop-name}" src="{$val.shop_icon}">
					<div class="masking"></div>
					<span>{$val.discount}</span>
				</a>                                 
				<eq name="mod" value="19"></li><li></eq>
			</volist>
			</li>
			</ul>
		</div>
	</div>
 
</div>


<div class="bmain {:C('ftx_site_width')} m0a clear tag-list"">

<div class="brand-box">
<volist name="lists" id="val">
                        <div class="bd">
                <div class="normal-title clear">
                    <a href="{:U('brand/dlist',array('uid'=>$val['shop']['uid']))}" target="_blank" se_prerender_url="complete">
                        <div class="title"><h3>{$val['shop']['txt']}</h3></div><span class="txt fr">{$val['shop']['discount']}</span>
                    </a>
                </div>
            </div>
            <div class="bd">
                <div class="main {:C('ftx_site_width')} clear">
	<ul class="goods-list {:C('ftx_site_wc')}">
		<volist name="val['items']" id="item" key="i" mod="4" offset="0" length="8" >
		<li  class="<eq name="mod" value="3"> last</eq>">
			<div class="sid_{$item.sellerId}  list-good   {$item.class} {$i}" id="nid_{$item.num_iid}">
				<div class="good-pic">
					<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}"   target="_blank"><img src='/static/8mobcom/images/blank.gif' data-original='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}" class="lazy"   /></a>
					<div class="yhq"> </div>
				</div>
				<h3 class="good-title">
					<if condition="$item.ems eq 1">[包邮]</if><a target="_blank" biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}" class="title">{$item.title}</a>
					<if condition="$item.volume gt 0 "><span class="sold">已售<em>{$item.volume}</em></span><else/><span class="sold">新品上架<em></em></span></if>
				</h3>
				<div class="good-price">
					<span class="price-current"><em>￥</em>{$item.coupon_price}</span>
					<span class="des-other">
						<span class="price-old"><if condition="$item.zk lt 10"><em>¥{$item.price}</em><u>({$item.zk}折)</u> </if></span>
						<span class="discount show">
							<b class="icon_gai" title="拍下改价"></b>
						</span>
					</span>
					<div class="btn-new buy">
					<if condition="$item.shop_type eq 'C' ">
						<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}"  target="_blank" rel="nofollow"><em class="icon_n"></em><span>淘宝</span></a>
					<elseif condition="$item.shop_type eq 'B' " />
						<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}"  target="_blank" rel="nofollow"><em class="icon_t"></em><span>天猫</span></a>
					<elseif condition="$item.shop_type eq 'D' " />
						<a href="{$item.click_url}" target="_blank" rel="nofollow"><em class="icon_j"></em><span>京东</span></a>
					<else />
						<a href="{:U('jump/'.$item['num_iid'])}" target="_blank" rel="nofollow"><span>去抢购</span></a>
					</if> 
					</div>
				</div>
				<eq name="i" value="8">
					<div class="brand-more">
						<div class="brand-bd"></div>
						<a href="{:U('brand/dlist',array('uid'=>$val['shop']['uid']))}" target="_blank"><span class="txt">共<b>{$val['shop']['items_total']}</b>款</span></a>
					</div>
				</eq>
				
			</div>
		</li>
		</volist>
	</ul>
	<div class="clear"></div> 
</div>
            </div>
                    




</volist>
</div>



</div>



<div class="main {:C('ftx_site_width')} clear">
	<div class="page">
		<div class="pageNav">{$page}</div>
	</div>
</div>




	<div style="position: relative;width: 980px;height: 30px;margin: 10px auto 8px;">
		<div style="position: relative;padding-top: 10px;float: right;display: inline;">内容资源来自：<a href="http://www.ftxia.com/" target="_blank">飞天侠开放平台</a></div>
	</div>
	 
 <script>
        //初始化
        $(".slide-logos .next-btn").click(function(){
            $(".logos-box ul").stop(true,true).animate({marginLeft:-1*$(".logos-box li:eq(0)").width()},100,function(){
                $(".logos-box ul").append($(".logos-box li:eq(0)").clone());
                $(".logos-box li:eq(0)").remove();
                $(".logos-box ul").css("margin-left",0);
            })
        });
        $(".slide-logos .prev-btn").click(function(){
            $(".logos-box ul").prepend($(".logos-box li:last").clone());
            $(".logos-box li:last").remove();
            $(".logos-box ul").css("margin-left",-1*$(".logos-box li:eq(0)").width());
            $(".logos-box ul").stop(true,true).animate({marginLeft:0},100)
        });

        var F_selected = function(){
            var brand_id = location.href.split("#")[1];
            $("#" + brand_id).addClass("selected-active");
            $("li.selected-active").on("mouseover",function(){
                $(this).removeClass("selected-active")
            })
        }
        F_selected();
    </script> 
<include file="public:footer" />
</body>
</html>
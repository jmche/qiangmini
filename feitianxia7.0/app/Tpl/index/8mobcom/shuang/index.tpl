<!doctype html>
<html>
<head>
<include file="public:head" />
<link rel="stylesheet" href="http://static2.51fanli.net/static/taobao-common-css-v3.css">
<link rel="stylesheet" href="http://static2.51fanli.net/taobao/css/taobao-ju.css">
<load href="__STATIC__/ftxia/css/tmall.css" />
<style>
.ju-filter {width: 980px;position: relative;margin-top: 20px;z-index:1;}
#content {width: 980px;margin: 0 auto;}
#content {padding-left: 0px;padding-right: 2px;}
.ju-itemlist ul {width: 1020px;}
.ju-itemlist li {margin: 0px 38px 38px 0;-webkit-animation-fill-mode: forwards;animation-fill-mode: forwards;}
li.brand {display:none;}
.pages {float: center;}
.clearfix {clear: both;display: block;height: auto;overflow: hidden;visibility: visible;width: auto;}
</style>
</head>
<body>
<include file="public:header" />
<div class="container ju-filter">
	<div class="ju-category">
		<div class="filter-cat clearfix">
			<ul class="clearfix">
				<li <if condition="$cid eq 0"> class="on"</if> ><a href="/shuang">全部</a></li>
				<volist name="cats" id="vol"> 
				<li <if condition="$cid eq $vol['id']"> class="on"</if> ><a href="{:U('shuang/index',array('cid'=>$vol['id']))}">{$vol.name}</a></li>
				</volist>
			</ul>
		</div>
	</div>
	<div class="ju-filter-nav">一共有{$total}件双十二商品</div>
</div>
<div class="mains">
        <div class="contain">
            <div class="sort-by">
                <span class="title fl">排序顺序 ：</span>
                <ul class="types fl">
                    <li <if condition="'top' eq $sort"> class="active"</if> ><a href="{:U('shuang/index',array('sort'=>'top'))}">置顶推荐</a></li>
                    <li class="cur"></li>
                    <li <if condition="'new' eq $sort"> class="active"</if> ><a href="{:U('shuang/index',array('sort'=>'new'))}">按时间排序</a></li>
                </ul>
                <p class="double-tips fr">双12超值商品由资深买家收集而来，每隔2小时更新一次，亲可以提前收藏起来啦~！</p>
            </div>
			<present name="items">
            <ul class="product-list">
			<volist name="items" id="item" key="i" mod="3">
                <li <eq name="mod" value="2">class="mr0"</eq>>
                    <div class="list-good">
					<h3><if condition="$item.shop_type eq 'C' "><i class="tao_n" title="淘宝网"></i></if><if condition="$item.shop_type eq 'B' "><i class="tao_t" title="天猫商城"></i></if> <a href="http://api.8mob.com/click/url?id={$item.num_iid}"  target="_blank" title="{$item.title}">{$item.title}</a></h3>
                        <div class="pic"><a href="{:U('jump/index',array('iid'=>$item['num_iid']))}"  target="_blank"><img src="{$item.pic_url}_310x310.jpg" height="260" width="290"></a></div>
                        <div class="buy-action">
                            <span class="price"><em>￥</em>{$item.coupon_price}</span>
                            <span class="oldprice"><em>¥</em>{$item.price}</span><if condition="$item['ems'] eq 1"><span class="by">/包邮</span></if> 
                            <a href="{:U('jump/index',array('iid'=>$item['num_iid']))}"  target="_blank" class="links "></a>
                        </div>
						<div class="pic-des" style="display:none" >
						   <div class="des-state">
							   <span class=" fl">双十二价：￥{$item.shuang_price}元</span>
							   <if condition="$item['hongbao'] eq 1"><span class="icon-1212-hongbao" title="领取店铺红包"></span></if>
							   <span class=" fr">差价：￥{$item.shuang_deal}元</span>
						   </div>
					   </div>                      
                    </div>
                </li>
				</volist>
				</ul>
				  </present>
            <div class="clear"></div>
            <div class="page"><em></em><div>{$page}</div></div>
        </div>
    </div>
	<div style="position: relative;width: 980px;height: 30px;margin: 10px auto 8px;">
		<div style="position: relative;padding-top: 10px;float: right;display: inline;">内容资源来自：<a href="http://open.ftxia.com/" target="_blank">飞天侠开放平台</a></div>
	</div>

<script>
$('.product-list div.list-good').mouseenter(function(){
	$(this).find(".pic-des").show();
}).mouseleave(function(){
	$(this).find(".pic-des").hide();
});
</script>
<include file="public:footer" />
</body>
</html>
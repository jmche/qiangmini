<include file="public:header" />
<!--模板样式-->
<div class="subnav">
	<div class="content_menu ib_a blue line_x">
		<a class="on"><em>性能优化</em></a>
	</div>
</div>

<div class="pad_lr_10">

<div class="explain-col">
温馨提示：<span class="green">小站点建议关闭网站缓存<br>
<span class="red"><b>注意</b>：缓存时间单位为秒，建议设置3600 即一个小时以上。设置数值越小越性能要求越高！<br>
	</span><br>
</div>



<form id="info_form" action="{:u('setting/edit')}" method="post">
	<table width="100%" class="table_form contentWrap">
		<tr>
			<th width="100">网站缓存 :</th>
			<td>
				<label><input type="radio" <if condition="C('ftx_site_cache') eq '1'">checked="checked"</if> value="1" name="setting[site_cache]"> {:L('open')}</label> &nbsp;&nbsp;
				<label><input type="radio" <if condition="C('ftx_site_cache') eq '0'">checked="checked"</if> value="0" name="setting[site_cache]"> {:L('close')}</label>
			</td>
		</tr>
		<tr style="display:none">
			<th>缓存目录 :</th>
			<td>
				<input type="text" name="setting[site_cachepath]" size="20" class="input-text" value="{:C('ftx_site_cachepath')}" />
				&nbsp;    <span class="gray">设置缓存的目录，建议设置为 data/runtime/Data/ </span>
			</td>
		</tr>
		<tr>
        		<th>缓存时间 :</th>
        		<td>
				<input type="text" name="setting[site_cachetime]" size="10" class="input-text" value="{:C('ftx_site_cachetime')}" />
				&nbsp;    <span class="gray">设置缓存更新的时间，单位为秒，0 为关闭。请根据实际情况进行调整，建议设置为 3600。</span>
			</td>
    		</tr>
		<tr>
        		<th>宝贝点击记录 :</th>
        		<td>
				<label><input type="radio" <if condition="C('ftx_item_hit') eq '1'">checked="checked"</if> value="1" name="setting[item_hit]"> {:L('open')}</label> &nbsp;&nbsp;
				<label><input type="radio" <if condition="C('ftx_item_hit') eq '0'">checked="checked"</if> value="0" name="setting[item_hit]"> {:L('close')}</label>

				&nbsp;    <span class="gray">开启或关闭宝贝浏览记录数量。</span>
			</td>
    		</tr>

		<tr>
        		<th></th>
        		<td><input type="hidden" name="menuid"  value="{$menuid}"/><input type="submit" class="smt mr10" name="do" value="{:L('submit')}"/></td>
    		</tr>
	</table>
</form>
</div>
<include file="public:footer" />
</body>
</html>
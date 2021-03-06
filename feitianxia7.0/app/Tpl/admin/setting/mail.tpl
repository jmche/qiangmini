<include file="public:header" />
<!--邮件服务器设置-->
<div class="common-form">
	<form id="info_form" action="{:u('setting/edit')}" method="post">
	<table width="100%" class="table_form contentWrap">
    	<tr class="y-bg">
        	<th width="150">{:L('mail_send_mode')} :</th>
        	<td>
            	<input type="radio" <if condition="C('ftx_mail_server.mode') eq 'mail'">checked="checked"</if> value="mail" name="setting[mail_server][mode]"> {:L('mail_function_mode')} &nbsp;&nbsp;
            	<input type="radio" <if condition="C('ftx_mail_server.mode') eq 'smtp'">checked="checked"</if> value="smtp" name="setting[mail_server][mode]"> {:L('smtp_mode')} &nbsp;&nbsp;<span class="gray">{:L('mail_mode_desc')}</span>
            </td>
    	</tr>
    </table>
    <table width="100%" class="table_form contentWrap">
        <tr>
        	<th width="150">{:L('smtp_host')} :</th>
        	<td><input type="text" name="setting[mail_server][host]" class="input-text" size="30" value="{:C('ftx_mail_server.host')}"><span>&nbsp;&nbsp;例:smtp.163.com</span></td>
    	</tr>
        <tr>
        	<th>{:L('smtp_port')} :</th>
        	<td><input type="text" name="setting[mail_server][port]" class="input-text" value="{:C('ftx_mail_server.port')}" size="30"><span>&nbsp;&nbsp;正常端口为25</span></td>
    	</tr>
        <tr>
        	<th>{:L('smtp_from')} :</th>
        	<td><input type="text" name="setting[mail_server][from]" class="input-text" size="30" value="{:C('ftx_mail_server.from')}"><span>&nbsp;&nbsp;例:ftxia.com@163.com</span></td>
    	</tr>
        <tr>
        	<th>{:L('smtp_auth_username')} :</th>
        	<td>
            	<input type="text" name="setting[mail_server][auth_username]" class="input-text" size="30" value="{:C('ftx_mail_server.auth_username')}"><span>&nbsp;&nbsp;例:ftxia.com@163.com</span>
            </td>
    	</tr>
        <tr>
        	<th>{:L('smtp_auth_password')} :</th>
        	<td><input type="password" name="setting[mail_server][auth_password]" class="input-text" size="30" value="{:C('ftx_mail_server.auth_password')}"></td>
    	</tr>
        <tr>
        	<th>{:L('test_email')} :</th>
        	<td>
            	<input type="text" id="J_email" class="input-text" size="30" value="">
            	<input type="button" id="J_mail_test" value="{:L('send_test_mail')}" class="btn">
                <span id="J_mail_test_tip">测试之前请先保存设置</span>
		<span>&nbsp;&nbsp;测试失败? <a href="http://bbs.8mob.com/forum.php?mod=viewthread&tid=5696" target="_blank">请点这里查看教程!</a></span>
            </td>
    	</tr>
        <tr>
        	<th></th>
        	<td><input type="hidden" name="menuid"  value="{$menuid}"/><input type="submit" class="smt mr10" value="保存"/></td>
    	</tr>
	</table>
	</form>
</div>
<include file="public:footer" />
<script>
$(function(){
    $('#J_mail_test').live('click', function(){
        var email = $('#J_email').val();
        if(email == ''){
            $('#J_mail_test_tip').addClass('red').html('{:L('please_input')}{:L('test_email')}');
            return false;
        }
        $.getJSON('{:U('setting/ajax_mail_test')}', {email:email}, function(result){
            if(result.status == 1){
                $('#J_mail_test_tip').removeClass('red').addClass('green').html('{:L('send_test_email_successed')}');
            }else{
                $('#J_mail_test_tip').addClass('red').html('{:L('send_test_email_failured')}');
            }
        });
    });
});
</script>
</body>
</html>
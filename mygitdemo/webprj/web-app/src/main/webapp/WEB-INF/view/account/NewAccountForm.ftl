<div id="Catalog" style="height:660px;">
    <form id="theAccountForm" method="post" action="${base}/account/newAccount">
    <div style="width:33%;height:360px;float:left;">
	<h3>User Information</h3>
	<table>
		<tr>
			<td>User ID:</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>New password:</td>
			<td><input type="text" name="password" id="password" /></td>
		</tr>
		<tr>
			<td>Repeat password:</td>
			<td><input type="text" name="repeatedPassword" /></td>
		</tr>
    </table>
    </div>

    <div style="width:33%;height:360px;float:left;">
    <h3>Account Information</h3>

    <table>
	<tr>
		<td>姓名:</td>
		<td><input type="text" name="realName" /></td>
	</tr>
	<tr>
		<td>邮箱:</td>
		<td><input type="text" size="40" name="email" /></td>
	</tr>
	<tr>
		<td>手机:</td>
		<td><input type="text" name="phone" /></td>
	</tr>
	<tr>
		<td>Address 1:</td>
		<td><input type="text" size="40" name="address1" /></td>
	</tr>
	<tr>
		<td>Address 2:</td>
		<td><input type="text" size="40" name="address2" /></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><input type="text" name="city" /></td>
	</tr>
	<tr>
		<td>State:</td>
		<td><input type="text" size="4" name="state" /></td>
	</tr>
	<tr>
		<td>Zip:</td>
		<td><input type="text" size="10" name="zip" /></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><input type="text" size="15" name="country" /></td>
	</tr>
    </table>
    <#if errors.fieldErrorCount gt 0>
        <#list errors.fieldErrors as err>
        ${err.field}------${err.defaultMessage}<br/>
        </#list>
    </#if>
    </div>


    <div style="width:33%;height:360px;float:left;">
    <h3>Profile Information</h3>

    <table>
	<tr>
		<td>Language Preference:</td>
		<td><!--stripes:select name="account.languagePreference">
			<stripes:options-collection collection="${actionBean.languages}" />
		</stripes:select--></td>
	</tr>
	<tr>
		<td>Favourite Category:</td>
		<td><!--stripes:select name="account.favouriteCategoryId">
			<stripes:options-collection collection="${actionBean.categories}" />
		</stripes:select--></td>
	</tr>
	<tr>
		<td>Enable MyList</td>
		<td><input type="checkbox" name="account.listOption" /></td>
	</tr>
	<tr>
		<td>Enable MyBanner</td>
		<td><input type="checkbox" name="account.bannerOption" /></td>
	</tr>

    </table>
    </div>

	<input type="submit" id="newAccount1" value="保存 (表单提交)" style="font-size:14px;font-weight:bold;width:260px;height:42px;" />
	<input type="button" id="newAccount2" value="保存 (Ajax提交)" style="font-size:14px;font-weight:bold;width:260px;height:42px;margin-left:20px;" />
    </form>
</div>

<script type="text/javascript">
function getValidMsg(key) {
    mylang = {
        'msg_realName_required': '请输入您的姓名',
        'msg_realName_rangelength': '姓名必须在2至10个字之间',
        'msg_email_required': '请输入您的邮箱',
        'msg_email_email': '请输入合法的邮箱',
        'msg_password_required': '请输入您的登录密码',
        'msg_password_length': '密码长度为{0}-{1}位之间',
        'msg_confirmpass_required': '请输入您的确认密码',
        'msg_confirmpass_equalTo': '密码与确认密码不同',
        'ls_input_captcha': '请输入验证码',
        'ls_captcha_length': '验证码的长度为{0}位',
        'ls_account_email': '账户名为邮箱地址',
        '':''
    };
    return mylang[key];
}
$(document).ready(function() {
    $("#theAccountForm").validate({
        rules: {
            realName: {
                required: true,
                rangelength: [2, 10]
            },
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                rangelength: [6, 20]
            },
            repeatedPassword: {
                required: true,
                equalTo: "#password"
            }
        },
        messages: {
            realName: {
                required: getValidMsg('msg_realName_required'),
                rangelength: getValidMsg('msg_realName_rangelength')
            },
            email: {
                required: getValidMsg('msg_email_required'),
                email: getValidMsg('msg_email_email')
            },
            password: {
                required: getValidMsg('msg_password_required'),
                rangelength: $.format(getValidMsg('msg_password_length'))
            },
            repeatedPassword: {
                required: getValidMsg('msg_confirmpass_required'),
                equalTo: getValidMsg('msg_confirmpass_equalTo')
            }
        },
        submitHandler: function(form) {
            form.submit();
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            //error.appendTo( placement );
        },
        onkeyup: false
    });

    $("#newAccount2").click(function() {
        $.ajax({
            type: "POST",
            url:  "${base}/account/newAccount",
            data: $('#theAccountForm').serialize(),
            success:function(data) {
                alert("成功");  
            },
            error:function(e) {
                alert("出错："+e);
            }
        });
    });
});
</script>
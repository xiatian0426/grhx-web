<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>付费指导</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="${jsRoot}/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" href="${cssRoot}/main.css"/>
</head>
<style>
@font-face{
font-family:"Times New Roman";
}

@font-face{
font-family:"宋体";
}

@font-face{
font-family:"Wingdings";
}

@font-face{
font-family:"Calibri";
}

p.MsoNormal{
mso-style-name:正文;
mso-style-parent:"";
margin:0pt;
margin-bottom:.0001pt;
mso-pagination:none;
text-align:justify;
text-justify:inter-ideograph;
font-family:Calibri;
font-size:10.5000pt;
mso-font-kerning:1.0000pt;
}

span.10{
font-family:'Times New Roman';
}

span.15{
font-family:Calibri;
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

span.16{
font-family:Calibri;
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

span.17{
font-family:'Times New Roman';
color:rgb(0,0,255);
text-decoration:underline;
text-underline:single;
}

p.MsoHeader{
mso-style-name:页眉;
margin:0pt;
margin-bottom:.0001pt;
border-bottom:1.0000pt solid windowtext;
mso-border-bottom-alt:0.7500pt solid windowtext;
padding:0pt 0pt 1pt 0pt ;
layout-grid-mode:char;
mso-pagination:none;
text-align:center;
font-family:Calibri;
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

p.MsoFooter{
mso-style-name:页脚;
margin:0pt;
margin-bottom:.0001pt;
layout-grid-mode:char;
mso-pagination:none;
text-align:left;
font-family:Calibri;
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

span.msoIns{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:underline;
text-underline:single;
color:blue;
}

span.msoDel{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:line-through;
color:red;
}

table.MsoNormalTable{
mso-style-name:普通表格;
mso-style-parent:"";
mso-style-noshow:yes;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt;
mso-para-margin:0pt;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-family:'Times New Roman';
font-size:10.0000pt;
mso-ansi-language:#0400;
mso-fareast-language:#0400;
mso-bidi-language:#0400;
}
@page{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;}@page Section0{
margin-top:72.0000pt;
margin-bottom:72.0000pt;
margin-left:90.0000pt;
margin-right:90.0000pt;
size:595.3000pt 841.9000pt;
layout-grid:15.6000pt;
}
div.Section0{page:Section0;}
</style>
<jsp:include  page="../def/top.jsp"/>
<body style="tab-interval:21pt;text-justify-trim:punctuation;" ><!--StartFragment--><div class="Section0"  style="margin:0  auto;margin-top:10px; margin-bottom:30px;width: 800px;layout-grid:15.6000pt;" ><p class=MsoNormal ><b><span style="mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;" ><font face="宋体" >付费指导</font></span></b><b><span style="mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;" ><o:p></o:p></span></b></p><p class=MsoNormal ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >第一步：进入中国招投标项目网</font>(http://www.bidwin.cn)；</span><span><a href="http://www.bidcenter.com.cn/zhuce.html"  title="注册-中国采招网" ><span class="17"  style="mso-spacerun:'yes';font-family:宋体;color:rgb(0,52,154);font-size:9.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" ><a href="/account/goRegister" style="color:rgb(0,52,154)">注册</a></font></span></a></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >并了解会员服务</font>&nbsp;<font face="宋体" >（具体查阅中国招投标项目网</font></span><span><a href="http://www.bidcenter.com.cn/help/fwlb.shtml"  title="服务列表-中国采招网" ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >服务列表</font></span></a></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >）；</font></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></p><p class=MsoNormal ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >第二步：选择要办理会员级别；</font></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></p><p class=MsoNormal ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >第三步：向客服专员索要供应商协议书；填写供应商协议书；</font></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></p><p class=MsoNormal ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >第四步：</font></span><span><a href="mailto:按照协议书金额办理款项并将相关凭证与协议书发送至guoruihongxin@163.com；" ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >按照协议书金额办理款项并将相关凭证与协议书发送给客服专员；</font></span></a></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></p><p class=MsoNormal ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >第五步：中国招投标项目网在汇款到帐后</font>30分钟内开通会员服务。</span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></p><p class=MsoNormal ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p>&nbsp;</o:p></span></p><p class=MsoNormal ><b><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(0,0,0);font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >公司汇款：</font></span></b><b><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(0,0,0);font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></b></p><p class=MsoNormal ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >帐</font>&nbsp;&nbsp;&nbsp;&nbsp;<font face="宋体" >户：北京国睿鸿信科技有限公司</font></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><br></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >开户银行：招商银行股份有限公司北京世纪城支行</font></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><br></span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >银行帐号：</font>110931813510801</span><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:9.0000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></p><p class=MsoNormal  style="text-indent:5.2500pt;mso-char-indent-count:0.5000;" ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:10.5000pt;mso-font-kerning:1.0000pt;" ><o:p>&nbsp;</o:p></span></p><p class=MsoNormal ><b><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(0,0,0);font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><font face="宋体" >个人支付：</font></span></b><b><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(0,0,0);font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p></o:p></span></b></p><p class=MsoNormal ><b><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(0,0,0);font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;background:rgb(255,255,255);mso-shading:rgb(255,255,255);" ><o:p>&nbsp;</o:p></span></b></p><p class=MsoNormal  style="text-indent:26.2500pt;mso-char-indent-count:2.5000;" ><span style="mso-spacerun:'yes';font-family:宋体;font-size:10.5000pt;mso-font-kerning:1.0000pt;" ><font face="宋体" >支付宝支付</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="宋体" >微信支付</font></span><span style="mso-spacerun:'yes';font-family:宋体;font-size:10.5000pt;mso-font-kerning:1.0000pt;" ><o:p></o:p></span></p><p class=MsoNormal  style="text-indent:5.2500pt;mso-char-indent-count:0.5000;" ><img width="124"  height="124"  src="${imageRoot }/zf_zfb.png" ><span style="mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;font-size:10.5000pt;mso-font-kerning:1.0000pt;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><img width="119"  height="122"  src="${imageRoot }/zf_wx.png" ><span style="mso-spacerun:'yes';font-family:宋体;color:rgb(68,68,68);font-size:10.5000pt;mso-font-kerning:1.0000pt;" ><o:p></o:p></span></p></div>
<jsp:include  page="../def/footer.jsp"/>
</body>
</html>
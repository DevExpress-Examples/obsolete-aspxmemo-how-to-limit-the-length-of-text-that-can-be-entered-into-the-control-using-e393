<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">

		<script type="text/javascript">
			function setMaxLength(textAreaElement, length) {
				textAreaElement.maxlength = length;
				ASPxClientUtils.AttachEventToElement(textAreaElement, "keyup", createEventHandler("onKeyUpOrChange"));
				ASPxClientUtils.AttachEventToElement(textAreaElement, "change", createEventHandler("onKeyUpOrChange"));
			}
			function onKeyUpOrChange(evt) {
				processTextAreaText(ASPxClientUtils.GetEventSource(evt));
			}
			function processTextAreaText(textAreaElement) {
				var maxLength = textAreaElement.maxlength;
				var text = textAreaElement.value;
				var isAcceptable = (maxLength == 0) || (text.length <= maxLength);
				if (maxLength != 0 && text.length > maxLength) 
					textAreaElement.value = text.substr(0, maxLength);
			}
			function createEventHandler(funcName) {
				return new Function("event", funcName + "(event);");
			}
		</script>
		<dxe:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="170px">
			<ClientSideEvents Init="function(s, e) { return setMaxLength(s.GetInputElement(), 10); }" />
		</dxe:ASPxMemo>
	</form>
</body>
</html>

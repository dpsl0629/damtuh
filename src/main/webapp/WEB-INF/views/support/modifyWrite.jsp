<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div class="contents">
   	<form id="operForm" action="/support/modifyConfirm" method="get">
	   	<div class="contents-box">
	        <div class="board-view">
	            <div class="board-view-header">
	                <p class="tit"><span class="bno" style="margin-right: 10px;"><c:out value="${notice.bno }"/></span><input type="text" name="title" value="${notice.title}"></p>
	            </div>
	
	            <div class="board-view-file">
	                <div class="file-list">
	                    <p class="file">
	                         <input name="uploadFile" type="file" multiple>
	                     </p>
	                     <div class="uploadResult">
	                     	<ul></ul>
	                     </div>
	                </div>
	            </div>
	            
	            <div class="board-view-con">
	                <textarea id="editor" cols="30" rows="10"><c:out  value="${ notice.content}"/></textarea>
	            </div>
	        </div>
	         	<div class="btn-lst">
	            	<button type="button" class="move btn-green">글 수정하기</button>
	       		</div>
	        	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
	        	<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
      	 	</div>
       </form>
</div>

<script>CKEDITOR.replace('editor');</script>

<script>
	
	$(".move").on("click", function(e){
		e.preventDefault();
		var operForm = $("#operForm");
		var data = CKEDITOR.instances.editor.getData();	
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj) {
			var jobj = $(obj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='" + jobj.data("filename") + "'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='" + jobj.data("uuid") + "'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='" + jobj.data("path") + "'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='" + jobj.data("type") + "'>";
		});

		var data = CKEDITOR.instances.editor.getData();	
		operForm.append("<input type='hidden' name='content' value='" + data + "'/>");
		operForm.append("<input type='hidden' name='bno' value='" + $(".bno").text() + "'/>");
		operForm.append(str);
		operForm.submit();
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize) {
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.")
			return false;
		}
		
		return true;
	}

	function showUploadedFile(uploadResultArr) {
		
		if (!uploadResultArr || uploadResultArr.length == 0) {return;}
		
		var uploadUL = $(".uploadResult ul");

		var str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			if (!obj.image) {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div><img class='ico' src='/resources/images/sub/attach.png'>" + obj.fileName + "<button type='button' class='delete-btn' data-file=\'" + fileCallPath + "\' data-type='file'>X</button>" + "</div></li>";
			} else {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				str += "<li data-path='" + obj.uploadPath + "' data-filename='" + obj.fileName + "' data-uuid='" + obj.uuid + "' data-type='" + obj.image + "'/><div><span>" + obj.fileName + "</span><img src='/support/display?fileName=" + fileCallPath + "'>" + "<button type='button' class='delete-btn' data-file=\'" + fileCallPath + "\' data-type='file'>X</button>" + "</div></li>";
			}
		});
		
		uploadUL.append(str).submit();
	}
	
	var cloneObj = $(".file").clone();
	
	$("input[type='file']").on("change", function(e) {
		console.log("파일 등록");
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for (var i = 0; i < files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		
		$.ajax({
			url : "/support/upload",
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				
				showUploadedFile(result);
				
				$(".file").html(cloneObj.html());
			}
		});
	});
	
	$(".uploadResult").on("click", "button", function(e) {
		var targetFile = $(this).data("file");
		var type = $(this).data("type");

		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: "/support/deleteFile",
			data : {fileName : targetFile, type:type},
			dataType : "text",
			type : "POST",
			success : function(result) {
				alert(result);
				targetLi.remove();
			}
		});
	});
</script>



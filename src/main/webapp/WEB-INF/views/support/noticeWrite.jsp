<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div class="contents">
    <form id="write-form" action="/support/noticeConfirm" method="post">
    	<div class="contents-box">
         <div class="board-view">
             <div class="board-view-header">
                 <p class="tit"><span style="margin-right: 10px;">제목</span><input type="text" class="title" name="title"></p>
             </div>

             <!-- :: 첨부파일 없을 경우 해당 영역 삭제 s :: -->
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
             <!-- :: 첨부파일 없을 경우 해당 영역 삭제 e :: -->

             <div class="board-view-con">
                 <textarea id="editor" cols="30" rows="10"></textarea>
             </div>
       
          <div class="btn-lst">
              <button type="submit" class="move btn-green" href="#lnk">글쓰기</button>
          </div>
       		</div>
    	</div>
    </form>
</div>
<!-- :: wrapper e :: -->
<script type="text/javascript">
    CKEDITOR.replace( 'editor' );
</script>
<script>
	$(document).ready(function() {
		var writeForm = $("#write-form");
		$(".move").on("click",function(e) {
			alert($(".title").val());
			var data = CKEDITOR.instances.editor.getData();	
				writeForm.append("<input type='hidden' name='content' value='" + data + "'/>");
				writeForm.submit();
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

		
		var uploadResult = $(".uploadResult ul");
		
		function showUploadedFile(uploadResultArr) {

			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				if (!obj.image) {
					str += "<li><div><img src='/resources/images/sub/attach.png'>" + obj.fileName + "<span data-file=\'" + fileCallPath + "\' data-type='file'>X</span>" + "</div></li>";
				} else {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					str += "<li><div><img src='/support/display?fileName=" + fileCallPath + "'>" + "<span data-file=\'" + fileCallPath + "\' data-type='file'>X</span>" + "</div></li>";
				}
			});
			
			$(".uploadResult ul").append(str);
		}
		
		$(".uploadResult").on("click", "span", function(e) {
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url: "/support/deleteFile",
				data : {fileName : targetFile, type:type},
				dataType : "text",
				type : "POST",
				success : function(result) {
					alert(result);
				}
			});
		});
		
		var cloneObj = $(".file").clone();
		
		$("input[type='file']").on("change", function(e) {
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
		
	});
</script>




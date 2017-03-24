<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <!-- Include external CSS. -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

    <!-- Include Editor style. -->
    <link href=".\resources\froala_editor_2.5.1\css\froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <link href=".\resources\froala_editor_2.5.1\css\froala_style.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!-- Create a tag that we will use as the editable area. -->
<!-- You can use a div tag as well. -->
<textarea></textarea>
<button id="saveButton">Save</button>

<!-- Include external JS libs. -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>

<!-- Include Editor JS files. -->
<script type="text/javascript" src=".\resources\froala_editor_2.5.1\js\froala_editor.pkgd.min.js"></script>
<script src=".\resources\froala_editor_2.5.1\js\languages\ko.js"></script>

<!-- Initialize the editor. -->
<script>

    $(function() {
        $('#saveButton').click(function () {
            $('textarea').froalaEditor('save.save')
        });

        var lat = ${lat};
        var lng = ${lng};
        $('textarea').froalaEditor({
            language: 'ko',
            imageUploadURL: './resources/upload_img',
            saveParam: 'content',
            saveURL: 'boardSave',
            saveMethod: 'POST',
            saveParams: {mem_id: '123', boa_latitude: lat, boa_longitude: lng}
        })
            .on('froalaEditor.save.before',function (e,editor) {
                console.log('세이브 전에 하는 일');
            })
            .on('froalaEditor.save.after', function (e, editor, response) {
                console.log('세이브 성공하고 나서 할일');
            })
            .on('froalaEditor.save.error',function (e,editor,error) {
                console.log('에러나면 뭐함');
            })
    });

</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script>
        function saveContent() {

            var boa_content = $('#myEditor').val();
            var boa_latitude = $('#lat').val();
            var boa_longitude = $('#lng').val();

            $.ajax({
                type: 'POST',
                url: 'boardSave',
                data: {
                    boa_content: boa_content,
                    boa_latitude: boa_latitude,
                    boa_longitude: boa_longitude
                },
                success: function (data) {
                    if (data == 1) {
                        console.log('저장성공~!');
                        var html = '';

                        html +=  'Lat: <input type="text" id="lat"><br>';
                        html += 'Lng: <input type="text" id="lng"><br>';
                        html += '장소ID: <input type="text" id="placeID">';
                        html += '<input type="button" id="deleteMarkers" value="마커초기화" onclick="javascript:deleteMarkers()">';
                        html += '<a href="boardWrite">글쓰기</a>';

                        $('#map_side').html(html);
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
    </script>
    <!-- Include external CSS. -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">

    <!-- Include Editor style. -->
    <link href=".\resources\froala_editor_2.5.1\css\froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <link href=".\resources\froala_editor_2.5.1\css\froala_style.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!-- Create a tag that we will use as the editable area. -->
<!-- You can use a div tag as well. -->
<textarea name="editor_content" id="myEditor"></textarea>
<input type="button" id="save" value="save" onclick="saveContent()">
<div id="location"></div>
<!-- Include external JS libs. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>

<!-- Include Editor JS files. -->
<script type="text/javascript" src=".\resources\froala_editor_2.5.1\js\froala_editor.pkgd.min.js"></script>
<script src=".\resources\froala_editor_2.5.1\js\languages\ko.js"></script>


<!-- Initialize the editor. -->
<script>

    $(function() {
        var lat = ${lat};
        var lng = ${lng};
        var location_lat = '<input type="hidden" id="lat" value=' + lat + '>';
        var location_lng = '<input type="hidden" id="lng" value=' + lng + '>';
        $('#location').append(location_lat);
        $('#location').append(location_lng);

        $('#myEditor').froalaEditor({
            toolbarInline: false,
            language: 'ko',
            imageUploadURL: 'upload_image',
        })
            .on('froalaEditor.image.beforeUpload', function (e, editor, images) {
                // Return false if you want to stop the image upload.
                console.log('이미지 업로드 전');
            })
            .on('froalaEditor.image.uploaded', function (e, editor, response) {
                // Image was uploaded to the server.
                console.log('이미지 업로드 하고 나서');
            })
            .on('froalaEditor.image.inserted', function (e, editor, $img, response) {
                // Image was inserted in the editor.
                console.log('이미지 삽입되고 나면');
            })
            .on('froalaEditor.image.replaced', function (e, editor, $img, response) {
                // Image was replaced in the editor.
                console.log('이미지가 교체되고 나면');
            })
            .on('froalaEditor.image.error', function (e, editor, error, response) {
                // Bad link.
                if (error.code == 1) {
                    console.log('1');
                }

                // No link in upload response.
                else if (error.code == 2) {
                    console.log('2');
                }

                // Error during image upload.
                else if (error.code == 3) {
                    console.log('3');
                }

                // Parsing response failed.
                else if (error.code == 4) {
                    console.log('4');
                }

                // Image too text-large.
                else if (error.code == 5) {
                    console.log('5');
                }

                // Invalid image type.
                else if (error.code == 6) {
                    console.log('6');
                }

                // Image can be uploaded only to same domain in IE 8 and IE 9.
                else if (error.code == 7) {
                    console.log('7');
                }

                // Response contains the original server response to the request if available.
            });

    });


</script>
</body>
</html>

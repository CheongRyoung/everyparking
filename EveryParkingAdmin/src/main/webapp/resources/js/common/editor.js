let editor;
$(function(){
    ClassicEditor
        .create(document.querySelector('#writeEditor'), {
            ckfinder: {
                uploadUrl: 'http://localhost:8123/admin/test/imageUpload'
            }
        })
        .then(newEditor => {
            editor = newEditor;
        })

        .then(editor => {
            window.editor = editor;

        })
        .catch(error => {
            console.error('Oops, something went wrong!');
            console.error('Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:');
            console.warn('Build id: g64ljk55ssvc-goqlohse75uw');
            console.error(error);
        });

    function uploadData() {
        const editorData = editor.getData();
        console.log(typeof (editorData));

        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {

            }
        }
        xhr.open("post", "../test/uploadTest", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        xhr.send("editorData=" + editorData);
    }
})

// 불러오는 자바스크립트(툴바삭제, 읽기만 가능)
    ClassicEditor
    .create( document.querySelector( '#readEditor' ))

    .then( editor => {
    window.editor = editor;
    editor.isReadOnly = true;
    const toolbarElement = editor.ui.view.toolbar.element;
    toolbarElement.style.display = 'none';
} )
    .catch( error => {
    console.error( 'Oops, something went wrong!' );
    console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
    console.warn( 'Build id: g64ljk55ssvc-goqlohse75uw' );
    console.error( error );
} );

let testGrid;

$(function(){
    let gridOption = {
        cols:[
            {title:"명칭1", name:"cache_size", type:"number"}
            , {title:"명칭2", name:"cycle_count", type:"number"}
            , {title:"명칭3", name:"cycle_option"}
            , {title:"명칭4", name:"increment"}
            , {title:"명칭5", name:"maximum_value"}
            , {title:"명칭6", name:"minimum_value"}
            , {title:"명칭7", name:"next_not_cached_value"}
            , {title:"명칭8", name:"start_value"}
            , {title:"명칭9", name:"button", defaultData:"Y", filter:function(){
                return '<button onclick="clickTest()">클릭</button>'   
            }}
        ],
        onRowClick:  "onRowClick",
        pagingBlock:'#pagingBlock',
        getParam : getParam
    };
    testGrid = new Grid("#testGrid", gridOption, " /test/testAjax", search);
})
function getParam(){
    return {}
}
function search(page){
    testGrid.search(page)
}
function confirmTest(){
    cmm.confirm("제목", "test", function(){}, function(){}, {btn1:'확인해', btn2: '취소해봐'});
}

function onRowClick(){
    alert("rowClick")
}

function clickTest(){
    event.stopPropagation(); //이벤트 전파방지
    // event.preventDefault();
    alert("button클릭했어")
}
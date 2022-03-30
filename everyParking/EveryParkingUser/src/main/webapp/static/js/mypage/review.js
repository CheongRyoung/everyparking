function deleteReview(REV_SEQ) {
    param = {'REV_SEQ': REV_SEQ};
    cmm.confirm('삭제', '삭제하시겠습니까', null, function(){
        ajaxCall('/mypage/review/deleteProcess', param, function(data) {
           cmm.alert(data.message, function(){
              if(data.code == 'S'){
                 location.href = '/mypage/review/list'
              }
           })
        });
     })
}		



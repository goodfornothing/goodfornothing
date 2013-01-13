/*
  A generic html safe embed block
*/

SirTrevor.Blocks.Embed = SirTrevor.Block.extend({ 

  title: "Embed",             
  className: "embed",  
  limit: 0,
  toolbarEnabled: true,         
  dropEnabled: false,
  formattingEnabled: false,

  editorHTML: function() {
		return _.template('<div class="expanding-textarea"><pre><span></span><br></pre><textarea class="required <%= className %>"></textarea></div>', this);
	},

  loadData: function(data){
    this.$$('.embed').html(data.text);
  },
  
  onBlockRender: function(){
    /* Make our expanding text area */
    
    var cont = this.$$('.expanding-textarea'),
        area = cont.find('textarea'),
        span = cont.find('span');
        
    area.bind('input', function(){
      span.text(area.val());
    });
    
    cont.addClass('active');

		area.focus();
		
  },
  
  toData: function() {
    var bl = this.$el,
        dataObj = {}
    
    dataObj.text = this.$$('.embed').val();

		this.setData(dataObj)

  }

});
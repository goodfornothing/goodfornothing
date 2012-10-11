/*
  A generic heading block level element
*/

SirTrevor.Blocks.Heading = SirTrevor.Block.extend({ 

  title: "Heading",             
  className: "heading",  
  limit: 0,
  toolbarEnabled: true,         
  dropEnabled: false,           

  editorHTML: function() {
		return _.template('<h2 class="required text-block <%= className %>" contenteditable="true"></h2>', this);
	},

	loadData: function(data){
     this.$$('.text-block').html(data.text);
   },
  
  // Function; Executed once content has been pasted into the block or any input field with the class 'paste-block'
  // The default onContentPasted function strips all the HTML from a text-block, as shown here.
  onContentPasted: function(ev) {  
  }

});
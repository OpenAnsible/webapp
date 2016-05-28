
if (!window.components) window.components = {};


window.components.Panel = React.createClass({
   render:function(){
       return (
          <div className="panel panel-primary"> 
            <div className="panel-heading"> 
                <h3 className="panel-title">{this.props.title}</h3> 
            </div> 
            <div className="panel-body"> Panel content </div> 
            </div>
       );
   } 
});
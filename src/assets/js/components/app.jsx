var App = React.createClass({
   render:function(){
       return (
         <div className="dashboard">
          <div className="row">
            <div className="col-lg-6"><Panel title="You" /></div>
            <div className="col-lg-6"><Panel title="Her" /></div>
          </div>
         </div>
       );
   } 
});
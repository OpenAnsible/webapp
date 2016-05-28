

window.App = React.createClass({
   render: function(){
       return (
         <div className="dashboard">
          <div className="row">
            <div className="col-lg-6"><window.components.Panel title="You" /></div>
            <div className="col-lg-6"><window.components.Panel title="Her" /></div>
          </div>
         </div>
       );
   }
});
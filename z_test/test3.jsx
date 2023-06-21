import React from 'react';

const Header = (props) => <h1 style={props.style}> Hello Eggh {props.cat} </h1>;

const World = function(props) {
  return (
    <>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
    </>
  );
}


class App extends React.Component {
  static propTypes = {
    txt: React.PropTypes.string,
    cat: React.PropTypes.number.isRequired
  };
  static defaultProps = {
    txt: 'this is the default text'
  };
  state = {
    urlDescription: "HELLO URL"
  };

  render() {
    const style = {
      fontSize: '33px',
      fontFamily: 'sans-serif'
    };


    return (
      <div>
        <input type="text" onChange={this.update.bind(this)} />
        <Header style={style} cat={this.props.cat} />
        <World style={style} urlDescription={this.state.urlDescription} />
        <div style={style}>{this.props.txt}</div>
      </div>
    );
  }
}


ReactDOM.render(<App cat={5} />, document.getElementById('app'));

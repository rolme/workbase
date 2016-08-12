import React from 'react';

export default class TestLabel extends React.Component {
  handleClick = (e) => {
    console.log('clicked!');
  }

  render() {
    return <p onClick={this.handleClick}>{this.props.children}</p>;
  }
}

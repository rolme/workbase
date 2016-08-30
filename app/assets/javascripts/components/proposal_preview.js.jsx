import React from 'react';

export default class ProposalPreview extends React.Component {
  render() {
    return(
      <div className="col-sm-8">
        { this.props.sections.map((section) => this.displaySection(section)) }
      </div>
    );
  }

  displaySection(section) {
    return(
      <div key={section.id} className="row">
        <div className="col-sm-12">
          <h4>{section.header}</h4>
        </div>
        <div className="col-sm-12" dangerouslySetInnerHTML={{__html: section.data}} />
      </div>
    );
  }
}

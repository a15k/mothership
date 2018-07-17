import { React, PropTypes, observer, observable, action } from '../helpers/react';
import { BrowserRouter, Route, Switch, NavLink } from 'react-router-dom';
import { Container, Dropdown, DropdownToggle, DropdownMenu, DropdownItem } from 'reactstrap';
import ReactDOM from 'react-dom';
import styled from 'styled-components';
import whenDomReady from 'when-dom-ready';
import User from '../models/user';
import Config from '../models/config';
import InteractionsApp from '../models/interaction-app';
import * as Pages from '../pages';

const MenuLink = ({ to, name }) => (
  <NavLink activeClassName="active" className="dropdown-item" to={to}>
    {name}
  </NavLink>
);
MenuLink.propTypes = {
  to: PropTypes.string.isRequired,
  name: PropTypes.string.isRequired,
};

const Nav = styled.nav`
 margin-bottom: 1rem;
`;

@observer
class A15KApplication extends React.Component {

  @observable isMenuOpen = false;

  @action.bound onMenuToggle() {
    this.isMenuOpen = !this.isMenuOpen;
  }

  renderPowerUserOptions() {
    return [
      <MenuLink key="i" to="/interactions" name="Interactions" />,
      <MenuLink key="u" to="/users" name="Users" />,
      <MenuLink key="t" to="/tokens" name="Tokens" />,
    ];
  }
  render() {
    return (
      <BrowserRouter>
        <div className="a15k-root">
          <Nav className="navbar navbar-dark bg-dark">
            <span className="navbar-brand">Assessment Network</span>
            <Dropdown isOpen={this.isMenuOpen} toggle={this.onMenuToggle}>
              <DropdownToggle caret>
                {User.username}
              </DropdownToggle>
              <DropdownMenu>
                {User.isMember && <MenuLink to="/search" name="Search" />}
                {User.isPowerUser && this.renderPowerUserOptions()}
                <DropdownItem divider />
                <DropdownItem href={Config.openstax_accounts_url}>Profile</DropdownItem>
                <DropdownItem onClick={User.logout}>Logout</DropdownItem>
              </DropdownMenu>
            </Dropdown>
          </Nav>
          <Container>
            <Switch>
              <Route path="/" exact component={Pages.Home} />
              <Route path="/search" component={Pages.Search} />
              <Route path="/users" component={Pages.Users} />
              <Route path="/tokens" component={Pages.Tokens} />
              <Route path="/interactions" component={Pages.Interactions} />
              <Route component={Pages.NotFound} />
            </Switch>
          </Container>
          <form id="logout-form" action="/accounts/logout" method="post">
            <input type="hidden" name="authenticity_token" value={Config.csrf_token} />
            <input type="hidden" name="_method" value="delete" />
          </form>
        </div>
      </BrowserRouter>
    );
  }
}

whenDomReady(() => {
  const data = JSON.parse(document.getElementById('bootstrap-data').innerText);
  User.bootstrap(data);
  InteractionsApp.api_url = data.interactions_api_url;
  ReactDOM.render(<A15KApplication />, document.getElementById('application-root'));
});

export default A15KApplication;

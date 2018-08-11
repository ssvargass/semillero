import confgiService from './config';

const semilleroService = {};

semilleroService.getProjectsByText = function (text) {
  const localUrl = `${confgiService.apiUrl}api/search/?format=json&state=publicado`;
  const url = (text !== '') ? `${localUrl}&search=${text}` : localUrl;
  return fetch(url, confgiService.config)
    .then(data => data.json())
    .catch(error => console.error(error));
};

semilleroService.getProjectsByProperty = function (property, value) {
  const localUrl = `${confgiService.apiUrl}api/proyecto/?format=json&state=publicado&${property}=${value}`;
  return fetch(localUrl, confgiService.config)
    .then(data => data.json())
    .catch(error => console.error(error));
};

semilleroService.getProject = function (id) {
  const localUrl = `${confgiService.apiUrl}api/proyecto/?format=json&id=${id}`;
  return fetch(localUrl, confgiService.config)
    .then(res => res.json());
};

semilleroService.getCounter = function (property) {
  const localUrl = `${confgiService.apiUrl}api/${property}`;
  return fetch(localUrl, confgiService.config)
    .then(res => res.json())
    .catch(error => console.error(error));
};

semilleroService.getHitos = function (projectId) {
  const localUrl = `${confgiService.apiUrl}api/hito?format=json&proyecto=${projectId}`;
  console.log(localUrl);
  return fetch(localUrl, confgiService.config)
    .then(res => res.json())
    .catch(error => console.error(error));
};

export default semilleroService;

import http from '@/utils/http';

export const save = data => http.post({
  url: '/dic/save',
  data,
});

export const getList = params => http.get({
  url: '/dic/getList',
  params,
});

export const remove = params => http.get({
  url: '/dic/remove',
  params,
});

export const getDicByCode = params => http.get({
  url: '/dic/getDicByCode',
  params,
});

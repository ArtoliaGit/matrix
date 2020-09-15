import http from '@/utils/http';

export const save = data => http.post({
  url: '/systemParameters/save',
  data,
});

export const getList = params => http.get({
  url: '/systemParameters/getList',
  params,
});

export const remove = params => http.get({
  url: '/systemParameters/remove',
  params,
});

export const getSystemParameter = params => http.get({
  url: '/systemParameters/getSystemParameter',
  params,
});

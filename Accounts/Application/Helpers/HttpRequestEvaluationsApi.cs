using System.Net;
using Domain.Entities;
using System;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Application.Helpers
{
    public class HttpRequestEvaluationsApi
    {
        private readonly HttpClient client;
        public HttpRequestEvaluationsApi()
        {
            client = new HttpClient
            {
                BaseAddress = new Uri(AppSettings.BaseAddress)
            };
            client.DefaultRequestHeaders.Add("User-Agent", "Anything");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public float GetAverageScore(string consultantId)
        {
            var response = client.GetAsync("api/v1/Evaluations/average/" + consultantId).Result;
            response.EnsureSuccessStatusCode();

            var result = response.Content.ReadAsAsync<float>().Result;
            return result;
        }
    }
}

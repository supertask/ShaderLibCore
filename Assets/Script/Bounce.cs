using UnityEngine;

namespace ShaderLibCore
{
    public class Bounce : MonoBehaviour
    {
        [SerializeField] public SpringVectorType springVectorType = SpringVectorType.Up;
        [SerializeField] public float m_ExpFrequency = 30f;
        [SerializeField] public float m_CosFrequency = 100f;
        [SerializeField] public float m_Amplitude = 1.0f;

        private Camera m_MainCamera;
        private Material m_Material;
        private int m_RaycastHitHash;
        private int m_ImpactValueAtCurveHash;
        private int m_NormalDir;
        private float m_TimeSincePressed;

        void Start()
        {
            m_MainCamera = Camera.main;
            m_Material = GetComponent<Renderer>().sharedMaterial;
            m_RaycastHitHash = Shader.PropertyToID("_HitPositionWS");
            m_ImpactValueAtCurveHash = Shader.PropertyToID("_ImpactValueAtCurve");
            m_NormalDir = Shader.PropertyToID("_NormalDir");
            m_Material.SetVector(m_RaycastHitHash, Vector3.up);
            m_Material.SetFloat(m_ImpactValueAtCurveHash, 0f);
        }

        void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                Ray ray = m_MainCamera.ScreenPointToRay(Input.mousePosition);
                RaycastHit raycastHit;

                //Debug.Log("mousePosition: " + Input.mousePosition);
                if (Physics.Raycast(ray, out raycastHit))
                {
                    m_TimeSincePressed = 0;
                    //Debug.Log("raycastHit: " + raycastHit.point);
                    //m_Material.SetFloat("_Seed", Time.time);
                    m_Material.SetVector(m_NormalDir, Random.insideUnitSphere);
                    m_Material.SetVector(m_RaycastHitHash, raycastHit.point);
                }
            }
            if (m_TimeSincePressed < 1.0f) {
                m_TimeSincePressed += Time.deltaTime;
                m_Material.SetFloat(m_ImpactValueAtCurveHash, Util.SpringLightDamping(m_TimeSincePressed, m_ExpFrequency, m_CosFrequency, m_Amplitude));
            }
        }
    }
}
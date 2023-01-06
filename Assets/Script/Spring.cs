using UnityEngine;

namespace ShaderLibCore
{
    public enum SpringVectorType
    {
        Random = 0,
        Up,
        Forward,
    }

    public class Spring : MonoBehaviour
    {
        [SerializeField] public SpringVectorType springVectorType = SpringVectorType.Up;
        [SerializeField] public float m_ExpFrequency = 30f;
        [SerializeField] public float m_CosFrequency = 100f;
        [SerializeField] public float m_Amplitude = 0.4f;
        
        private Camera m_MainCamera;
        private Material m_Material;
        private int m_RandomVector;
        private int m_ImpactValueAtCurveHash;
        private float m_TimeSincePressed;

        void Start()
        {
            m_MainCamera = Camera.main;
            m_Material = GetComponent<Renderer>().sharedMaterial;
            m_RandomVector = Shader.PropertyToID("_RandomVector");
            m_ImpactValueAtCurveHash = Shader.PropertyToID("_ImpactValueAtCurve");
            m_Material.SetVector(m_RandomVector, Vector3.up);
            m_Material.SetFloat(m_ImpactValueAtCurveHash, 0f);
        }

        void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                OnButtonPressed();
            }

            if (m_TimeSincePressed < 1.0f)
            {
                m_Material.SetFloat(m_ImpactValueAtCurveHash, Util.SpringLightDamping(m_TimeSincePressed, m_ExpFrequency, m_CosFrequency, m_Amplitude));
                m_TimeSincePressed += Time.deltaTime;
            }
        }
        
        public void OnButtonPressed()
        {
            m_TimeSincePressed = 0.0f;
            if (springVectorType == SpringVectorType.Random) {
                m_Material.SetVector(m_RandomVector, Random.insideUnitSphere);
            }
            else if (springVectorType == SpringVectorType.Up) {
                m_Material.SetVector(m_RandomVector, Vector3.up);
            }
            else if (springVectorType == SpringVectorType.Forward) {
                m_Material.SetVector(m_RandomVector, Vector3.forward);
            }
        }
    }
}